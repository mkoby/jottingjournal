CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV["AMAZON_S3_ACCESS_KEY"],
    :aws_secret_access_key  => ENV["AMAZON_S3_SECRET_ACCESS_KEY"],
    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'jottingjournal'                     # required
  config.fog_public     = false                                   # optional, defaults to true
end
