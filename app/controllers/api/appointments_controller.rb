class Api::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :destroy]

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment
    else
      render json: { message: appointment.errors }, status: 400
    end
  end

  def show
    render json: @appointment
  end

  def destroy
    if @appointment.destroy
      render status: 204
    else
      render json: { message: 'Unable to delete appointment'},
      status: 400
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :date)
  end
end
