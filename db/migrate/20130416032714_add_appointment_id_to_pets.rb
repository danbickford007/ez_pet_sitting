class AddAppointmentIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :appointment_id, :integer
  end
end
