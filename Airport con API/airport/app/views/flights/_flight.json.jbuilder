json.extract! flight, :id, :departure_date, :arrival_date, :arrival, :name, :state_code, :departure_place, :arrival_place, :airport, :created_at, :updated_at
json.url flight_url(flight, format: :json)
