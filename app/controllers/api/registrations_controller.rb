class Api::BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    total_price = get_total_price(registration_params)
    registration = @event.registrations.new(registration_params.merge(total: total_price))

    if registration.save
      render status: 200, json: {
        message: "Registration successfully created",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  def update
    total_price = get_total_price(registration_params)
    registration = @event.registrations.find(params[:id])

    if registration.update(registration_params.merge(total: total_price))
      render status: 200, json: {
        message: "Registration successfully updated",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be updated",
        errors: registration.errors
      }.to_json
    end
  end

  private

  def get_total_price(registration_params)
    checkin = DateTime.parse(registration_params[:starts_at])
    checkout = DateTime.parse(registration_params[:ends_at])

    total_days = (checkout - checkin).to_i
    registration_params[:price].to_i * total_days
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:starts_at, :ends_at, :price)
  end
end
