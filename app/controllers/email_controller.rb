class EmailController < ApplicationController

  before_filter :access_denied, :except=>[:contact, :send_email]

  def index
    @emails = Email.where(:to_user=>session[:user][:id])
    @sent_emails = Email.where(:from_user=>session[:user][:id])
  end

  def open
    @email = Email.find(params[:email_id])
    @partial = '/email/new'
    @options = {'height'=>'500', 'width'=>'500'}.to_json
    render 'shared/lightbox'
  end

  def send_and_save
    Email.send_and_save(params[:email])
    redirect_to '/email'
  end

  def contact
    render 'contact'
  end

  def send_email
    #Thread.new do
      UserMailer.contact(params[:email], params[:content]).deliver
    #end
    redirect_to "/"
  end

end
