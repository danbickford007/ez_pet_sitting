class Pet < ActiveRecord::Base
  attr_accessible :amount, :breed, :special_instructions, :user_id, :name

  belongs_to :user
  has_many :appointments
end
