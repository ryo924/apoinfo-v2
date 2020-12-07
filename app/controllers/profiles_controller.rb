class ProfilesController < ApplicationController

  before_action :set_profile, only: [:index, :new, :create]
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:new, :create]

  def index
    @profiles = Profile.all.order(created_at: "DESC")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to appointment_profiles_path(@appointment)
    else
      render :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:customer_name, :customer_occupation, :position, :note).merge(appointment_id: params[:appointment_id])
  end

  def set_profile
    @appointment = Appointment.find(params[:appointment_id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @appointment.user
  end

end
