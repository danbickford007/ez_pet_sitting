class Appointment < ActiveRecord::Base
  attr_accessible :animal_id, :user_id, :created_at, :time, :address_id
  has_many :pets
  has_one :address, :foreign_key=>:address_id

  def self.get_current(date)
    before = Date.parse(date)
    printed_date = before
    after = before
    before = before.strftime("%m/%d/%Y 00:00:01")
    after = after.strftime("%m/%d/%Y 23:59:59")
    [Appointment.where("time between ? and ?", before, after).first, printed_date]
  end  
  
  def self.create_new(date, user, pets, address_id)
    date = Date.parse(date)
    app = Appointment.create(:user_id=>user.id, :time=>date, :address_id=>address_id)
    app.pets = Pet.find_all_by_id(pets)
    app.save
    Appointment.where(:user_id=>user.id)
  end



end
