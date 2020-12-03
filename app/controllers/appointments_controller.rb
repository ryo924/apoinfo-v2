class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all.order(created_at: "DESC")
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

  def show
    @appointment = Appointment.find(params[:id])
    @comment = Comment.new
    @comments = @appointment.comments
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @appointments = Appointment.search(params[:keyword]).order(created_at: "DESC")
  end

  private
  def appointment_params
    params.require(:appointment).permit(:title, :company, :customer, :date, :place, :purpose, :relation_id).merge(user_id: current_user.id)
  end

end
