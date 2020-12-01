class AppointmentsController < ApplicationController

  def index
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :company, :customer, :date, :place, :purpose, :relation_id).merge(user_id: current_user.id)
  end

end
