class CalendarController < ApplicationController

  skip_before_filter :access_denied

  def index
    if session[:user]
      user_id = session[:user][:id] 
    else 
      user_id = 0
    end
    @appointments = Appointment.where(:user_id=>user_id)
    
  end

  def show
    @appointment = Appointment.find(params[:appointment_id])
    @date = @appointment.time.strftime("%Y-%d-%m")
    @pets = Pet.find_all_by_user_id(session[:user][:id])
    @addresses = Address.where(:user_id=>session[:user][:id])
    @title = "Viewing your appointment"
    @options = {'height'=>'300', 'width'=>'900'}.to_json
    @partial = "current_appointment"
    render "shared/lightbox"
  end


end
