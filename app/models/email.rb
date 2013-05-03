class Email < ActiveRecord::Base
  attr_accessible :content, :from_user, :subject, :to_user

  def self.send_and_save(email)
    Email.create(email)
    #send email here
  end

end
