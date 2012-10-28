compute = Fog::Compute.new(:provider => 'AWS', :aws_access_key_id => ENV["AMAZON_S3_ACCESS_KEY"], :aws_secret_access_key => ENV["AMAZON_S3_SECRET_ACCESS_KEY"])
storage = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => ENV["AMAZON_S3_ACCESS_KEY"], :aws_secret_access_key => ENV["AMAZON_S3_SECRET_ACCESS_KEY"])
