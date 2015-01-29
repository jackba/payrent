json.array!(@payments) do |payment|
  json.extract! payment, :id, :user_id, :unit_id, :utility_charge_id, :total_paid
  json.url payment_url(payment, format: :json)
end
