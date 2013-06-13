class UserMailer < ActionMailer::Base
  default from: "vanessa@ezpetsitting.com"
  def contact(email, content)
    @url = "vanessakayez@aim.com"
    @email = email
    @content = content
    mail(:to => @url, :subject => "EZ PET SITTING EMAIL!!!")
  end
end
