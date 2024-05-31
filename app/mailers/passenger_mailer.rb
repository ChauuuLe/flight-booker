class PassengerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def confirmation_email(passenger)
    @passenger = passenger
    @flight = @passenger.flight
    @url  = flight_url(@flight)
    mail(to: @passenger.email, subject: 'Flight Booking Confirmation')
  end
end
