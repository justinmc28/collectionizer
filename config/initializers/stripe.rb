Rails.configuration.stripe = {
  :stripe_public_key => ENV['PUBLISHABLE_KEY'],
  :stripe_secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]