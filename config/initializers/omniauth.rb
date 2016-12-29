OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '362353794118973', 'dc755aa5d1cc94d755e5ec944cc5eca7'
end