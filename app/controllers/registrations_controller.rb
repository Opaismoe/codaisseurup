class RegistrationsController < ApplicationController
  before_action :load_event, :authenticate_user

  def create
    @registration = current_user.registration.create(registration_params.merge({
      event: @event }))

      redirect_to @registration.event, notice: "Thanks for your registration"
  end


  private

  def registration_params
    params.require(:registration).permit(:status, :guest_count)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end
