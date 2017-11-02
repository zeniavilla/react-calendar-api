class Api::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:destroy]

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment
    else
      render json: { message: appointment.errors }, status: 400
    end
  end

  def find_by_date
    appointment = Appointment.where(date: params[:date])
    render json: appointment
  end

  def destroy
    @appointment.destroy
    render body: nil, status: :no_content
  end

  private

  def set_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:title, :date)
  end
end
