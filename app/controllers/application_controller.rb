class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :access_denied

  def access_denied
    if !session[:user] && request.xhr?
      render "shared/access_denied"
    end
  end

end
