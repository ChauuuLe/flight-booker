class FlightsController < ApplicationController
  def search
    @airports = Airport.all.pluck(:name, :id)
    @dates = Flight.all.pluck(:departure_date).uniq
    @passenger_options = (1..10).to_a

    if params[:departure_airport].present? && params[:arrival_airport].present? && params[:date].present? && params[:passengers].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport],
        arrival_airport_id: params[:arrival_airport],
        departure_date: params[:date]
      )
    end
  end
  def index
    @flights = Flight.all

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:flight_date].present?
      flight_date = Date.parse(params[:flight_date])
      @flights = @flights.where(start_datetime: flight_date.beginning_of_day..flight_date.end_of_day)
    end

    @num_passengers = params[:num_passengers].to_i if params[:num_passengers].present?
  end
end

