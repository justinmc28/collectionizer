class Order < ActiveRecord::Base
  
  validates :amount, numericality: {greater_than_or_equal_to: 10}
  validates :email, presence: true
  after_save :send_product
  
def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: email, card: card)
    charge = Stripe::Charge.create(customer: customer.id, amount: amount_in_cents, currency: 'usd' )
    self.stripe_token = customer.id
    save!
  end
rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.message}"
  errors.add :base, "There was a problem with your credit card. Please try again or contact us at support@boxfirepress.com"
  false
end

def send_product
  FetchAppAPI::Base.basic_auth(:key => Rails.configuration.fetch[:key], :token => Rails.configuration.fetch[:token])
  fetch_order = FetchAppAPI::Order.create(
          :title => "Test Order",
          :first_name => "Donald",
          :last_name => "Duck",
          :email => self.email,
          :order_items => [{:sku => 'BCCF2013'}]
      )
  end

  
end
