class User < ActiveRecord::Base
  attr_accessible :email, :passcode
end
