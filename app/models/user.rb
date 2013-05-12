class User < ActiveRecord::Base
  attr_accessible :email, :passcode, :first_name, :last_name

  has_many :addresses
  has_many :pets

  def is_admin?
    email == 'danbickford007@yahoo.com' || email == 'vanessakayez@aim.com'
  end


end
