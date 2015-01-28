json.array!(@units) do |unit|
  json.extract! unit, :id, :description, :rent_charge, :security_charge, :security_paid, :user_id, :property_id
  json.url unit_url(unit, format: :json)
end
