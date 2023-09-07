Rails.configuration.stripe = {
  publishable_key: 'pk_test_4Gasxlkx28VttLwcfazw8rGW00Wvvkt11h',
  secret_key: 'sk_test_UHCPUe6fvAuGh4eapUkcbfxQ00giclAyFt'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
