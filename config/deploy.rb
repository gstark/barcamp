require 'erb'
require 'tmpdir'
require 'mongrel_cluster/recipes.rb'

# =============================================================================
# REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The deploy_to path must be the path on each machine that will
# form the root of the application path.

set :application, "barcamp"
set :deploy_to, "/srv/www/rails/#{application}"

# TODO: Change this so we don't have to use root
set :user, "root"
set :use_sudo, false

# Keep the last 10 releases when we perform a cleanup
set :keep_releases, 10


#
# Read a file and evaluate it as an ERB template.
# Path is relative to this file's directory.
class Capistrano::Configuration
  def maintenance_page( _title, _message )
    set :title,      _title
    set :message,    _message
    @title   = _title
    @message = _message
    ERB.new( File.read("./app/views/layouts/maintenance.rhtml") ).result(binding)
  end
end

# Restart a group of processes in monit
def monit_restart_group( group_name )
  run %{ /usr/bin/monit -g "#{group_name}" restart all }
end

# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.

set :rails_env, :production

set :remote_git_path,           "/usr/bin/git"
set :local_git_path,            "git"
set :repository,                "git://github.com/gstark/barcamp.git"
set :branch,                    "master"
set :remote_cache_directory,    "#{deploy_to}/shared/cached-copy"
set :remote_cache_subdirectory, "."
set :mongrel_conf,              "#{release_path}/config/mongrel_cluster.yml"

role :web, "gstark.com"
role :app, "gstark.com"
role :db,  "gstark.com", :primary => true


#########################################################
# Wrap "restart" with a disable/enable web.
#########################################################
before "deploy:restart", "deploy:web:disable"
after  "deploy:restart", "deploy:web:enable"

#########################################################
# After updating the code we have a few tasks to run
#########################################################
after  "deploy:update_code", "barcamp:after_update_code"

namespace :deploy do

  #require 'capistrano/configuration/actions/file_transfer'

  # This is essentially a copy of the git deployment strategy.  Since we need to copy
  # from a subdirectory, we need to implement our own.  I tried to subclass the RemoteCache
  # strategy to allow for a subdirectory, but ran into errors, so this is an explicit
  # reimplementation.
  task :update_code do
    if rails_env == :staging
      local_tar_file = File.join( Dir.tmpdir, "code.tgz" )
      puts "Creating tar file #{local_tar_file}"

      tar_command = %{ tar --exclude ./log/\\* -zcf #{local_tar_file} . }
      puts tar_command
      system tar_command

      run "mkdir -p #{release_path}"

      transfer :up, local_tar_file, release_path, :recursive => true, :via => :scp

      run "cd #{release_path}; tar -zxf code.tgz; rm -f code.tgz"
    else
      deploy_via_git_checkout
    end

    # Create symlinks, etc.  NOTE: This is important (the symlinks are necessary)
    finalize_update
  end

  namespace :web do

    desc "Present a maintenance page to visitors."
    task :disable do
      # on_rollback { delete "#{shared_path}/system/maintenance.html" }

      deadline  = ENV['UNTIL']
      reason    = ENV['REASON']

      maintenance = maintenance_page( "BarCamp - Scheduled Maintenance", 
                                  %{ The BarCamp app is currently #{reason || "undergoing scheduled maintence"}. We apologize for any inconvenience this may cause.<p> } )
      put maintenance, "#{shared_path}/system/maintenance.html", :mode => 0644
    end
  end

end

namespace :barcamp do

  task :after_update_code, :roles => [:web] do

    # Write out a custom 500.html message  
    maintenance = maintenance_page( %{ We're sorry, but something went wrong %},
                                    %{ <h1 style="font-size: 120%; color: #f00; line-height: 1.5em;">An Error Occurred Processing Your Request.</h1>
                                       <p>Support Staff has been notified, and is investigating the cause</p>
                                       <p>We appologize for the incovnenience.  Please click <a href="/">here</a> to return to the application.</p> } )
    
    put maintenance, "#{release_path}/public/500.html", :mode => 0644
  end
end

def deploy_via_git_checkout
  revision = `#{local_git_path} ls-remote #{repository} #{branch}`.split.first

  git_command = <<-END
    if [ -d #{remote_cache_directory} ]; then
      cd #{remote_cache_directory} &&
      #{remote_git_path} fetch &&
      #{remote_git_path} reset --hard #{revision} &&
      #{remote_git_path} submodule init &&
      #{remote_git_path} submodule update;
    else
      #{remote_git_path} clone #{repository} #{remote_cache_directory} &&
      cd #{remote_cache_directory} &&
      #{remote_git_path} checkout -b deploy #{revision} &&
      #{remote_git_path} submodule init &&
      #{remote_git_path} submodule update;
    fi
  END

  run( git_command )

  source_directory      = File.join( remote_cache_directory, remote_cache_subdirectory )
  revision_file_path    = File.join( release_path, "REVISION" )

  copy_command = "cp -RPp #{source_directory} #{release_path} && (echo #{revision} > #{revision_file_path})"
  run( copy_command )
end
