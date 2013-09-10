class Order < ActiveRecord::Base
  
  validates :amount, numericality: {greater_than_or_equal_to: 10}
  validates :email, presence: true
  validates :f_name, presence: true
  validates :l_name, presence: true
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
  
  if self.amount_in_cents >= 2000
  
  fetch_order = FetchAppAPI::Order.create(
          :title => "Complete Collection w/ Bonus Books",
          :first_name => self.f_name,
          :last_name => self.l_name,
          :email => self.email,
          :order_items => [{:sku => 'BPWYWCC2013-Bonus'}]
      )
      
  else
      fetch_order = FetchAppAPI::Order.create(
              :title => "Complete Collection",
              :first_name => self.f_name,
              :last_name => self.l_name,
              :email => self.email,
              :order_items => [{:sku => 'BPWYWCC2013'}]
          )  
      
  end
end

  
end
