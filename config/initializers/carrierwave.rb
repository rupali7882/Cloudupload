CarrierWave.configure do |config|
   config.fog_provider ='fog/google' 

   config.fog_credentials = { 
    provider: 'Google',
    google_storage_access_key_id:     'GOOGPMPYTNTVXVMUKTFK',
    google_storage_secret_access_key: 'TEKztyuXo8VPjAnTcsSv2x11XPGVW/TynEW56An1'
  }
  config.fog_directory = 'dhrup-storage'

  end