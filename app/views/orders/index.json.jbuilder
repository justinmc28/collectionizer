json.array!(@orders) do |order|
  json.extract! order, :amount, :email, :card
  json.url order_url(order, format: :json)
end
