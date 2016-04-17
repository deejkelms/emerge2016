OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 997422430334089, d6d6861e50a2caa377720a720b092dc7
end
