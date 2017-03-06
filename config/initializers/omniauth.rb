OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '229942094136138', '3f50d1f96a3f3d1b3cd4157312c6c4dd'
end