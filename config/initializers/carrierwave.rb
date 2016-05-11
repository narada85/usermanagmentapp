if Rails.env.production? or Rails.env.staging? or Rails.env.development?  
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJLTG2JNZTJTFD6NQ',                        # required
      :aws_secret_access_key  => '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'                        # required
      #:region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',             # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.storage = :fog
    config.fog_directory  = 'usermanagment'                     # required
    #config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {ssl_version: :TLSv1_2} # {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
    #config.use_action_status = true
  end

  # Kindeditor::AssetUploader.class_eval do
  #
  #   storage :fog
  #
  # end

end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true
  end
end