json.array!(@utility_charges) do |utility_charge|
  json.extract! utility_charge, :id, :utility_name, :utility_charge, :utility_charge_date, :property_id
  json.url utility_charge_url(utility_charge, format: :json)
end
