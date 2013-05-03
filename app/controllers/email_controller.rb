class EmailController < ApplicationController
  
  def index
    @emails = Email.where(:to_user=>session[:user][:id])
  end

  def send_and_save
    Email.send_and_save(params[:email])
    redirect_to '/email'
  end

end
