class Address < ActiveRecord::Base
  attr_accessible :special_instructions, :street, :user_id, :city, :appointment_id
  belongs_to :user
  belongs_to :appointment
end
