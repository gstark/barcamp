class ApplicationController < ActionController::Base  
  include AuthenticatedSystem

  before_filter :adjust_format_for_iphone

  helper :all # include all helpers, all the time

  protect_from_forgery # :secret => '7240bc391c9fd910b70d6be5014ce5ea'

  private

    # Set iPhone format if request to iphone.trawlr.com
    def adjust_format_for_iphone    
      request.format = :iphone if iphone_request?
    end

  # Return true for requests to iphone subdomain
  def iphone_request?
    return (request.subdomains.first == "iphone" || params[:format] == "iphone" || iphone_user_agent?)
  end

  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end

end

