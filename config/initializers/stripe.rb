Rails.configuration.stripe = {
  :stripe_public_key => 'pk_uSffTYAdYa9Jux4kz7Xc3THxywqIt', #ENV['PUBLISHABLE_KEY'],
  :stripe_secret_key      => 'PkC93REy8RrQ1TCPGyxiCdSmvE1eZTKl' #ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]