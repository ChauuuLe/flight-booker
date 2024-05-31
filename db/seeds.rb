# Clear existing data
Airport.delete_all
Flight.delete_all

# Create airports
airports = [
  { code: 'SFO' },
  { code: 'NYC' },
  { code: 'LAX' },
  { code: 'ORD' },
  { code: 'ATL' }
]

airports.each do |airport|
  Airport.find_or_create_by!(code: airport[:code])
end

# Create flights
airports = Airport.all
flight_data = [
  { departure_airport: airports[0], arrival_airport: airports[1], start_datetime: '2024-06-01 06:00:00', duration: 300 },
  { departure_airport: airports[1], arrival_airport: airports[0], start_datetime: '2024-06-01 12:00:00', duration: 300 },
  { departure_airport: airports[2], arrival_airport: airports[3], start_datetime: '2024-06-02 09:00:00', duration: 240 },
  { departure_airport: airports[3], arrival_airport: airports[4], start_datetime: '2024-06-02 13:00:00', duration: 180 },
  { departure_airport: airports[4], arrival_airport: airports[2], start_datetime: '2024-06-03 15:00:00', duration: 420 }
]

flight_data.each do |flight|
  Flight.create!(
    departure_airport: flight[:departure_airport],
    arrival_airport: flight[:arrival_airport],
    start_datetime: flight[:start_datetime],
    duration: flight[:duration]
  )
end
