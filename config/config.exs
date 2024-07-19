import Config

config :hcaptcha,
  verify_url: "https://api.hcaptcha.com/siteverify",
  timeout: 5000,
  sitekey: {:system, "HCAPTCHA_SITEKEY"},
  secret: {:system, "HCAPTCHA_SECRET"}

config :hcaptcha, :json_library, Jason

import_config "#{Mix.env()}.exs"
