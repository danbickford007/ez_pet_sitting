class AppointmentsController < ApplicationController

  before_filter :empty_params, :only=>:create

  def empty_params
    if params[:Pets].blank? or params[:Addresses].blank?
      render :js=>"alert('Please select both an address and pet.')"
    end
  end

  def create
    @appointments = Appointment.create_new(params[:time], session[:user], params[:Pets].keys, params[:Addresses].keys)
    render :js=>"window.location = '/calendar'"
  end

  def show
    @app, printed_date = Appointment.get_current(params[:date])
    @pets = Pet.where(:user_id=>session[:user][:id])
    @addresses = Address.where(:user_id=>session[:user][:id])
    if !@app.blank? && !@app.created_at.blank?
      @title = "Edit this current Sitting Session"
      @options = {'height'=>'300', 'width'=>'850'}.to_json
      @date = @app.time
    else
      @title = "Schedule a new Sitting Session"
      @options = {'height'=>'300', 'width'=>'850'}.to_json
      @date = printed_date
      
    end
    @partial = "calendar/schedule"
    render "shared/lightbox" 

  end

  def update_appointment
    appointment = Appointment.find(params[:appointment_id])
    appointment.pet_ids = params[:Pets].keys
    appointment.address_id = params[:Addresses].keys.first
    appointment.save
    render :js=>"window.location = '/calendar'"
  end

  def cancel
    app = Appointment.find(params[:id])
    app.destroy
    redirect_to "/calendar"
  end

end
