class ApplicationController < ActionController::Base
  protect_from_forgery


  #before_filter :access_denied, :except=>:access_denied
  
  def access_denied
    if !session[:user] 
      if request.xhr?
        render "shared/access_denied"
      else
        redirect_to '/users'
      end
    end
  end

end
