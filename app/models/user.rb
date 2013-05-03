class User < ActiveRecord::Base
  attr_accessible :email, :passcode

  has_many :addresses
  has_many :pets

end
