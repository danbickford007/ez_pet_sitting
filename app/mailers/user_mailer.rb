class UserMailer < ActionMailer::Base
  default from: "vanessa@ezpetsitting.com"
  @url = "vanessakayez@aim.com"
  def contact(email, content)
    @email = email
    @content = content
    mail(:to => @url, :subject => "EZ PET SITTING EMAIL!!!")
  end
end
