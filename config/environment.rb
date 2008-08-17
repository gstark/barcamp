# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_barcamp_session',
    :secret      => 'aef25c44352947a8ba3d0dbf06c874e72a03c8d0c76dce0b0fef3c06274dcfb19792cb96a7d32cfe4f22c511293a8544998561fa19ca2a800cb7f5b65cd8bc3f'
  }
end
