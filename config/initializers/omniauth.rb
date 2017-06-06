OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
   provider :google_oauth2, "1091858541776-ppek871l19mm5drs2nfa3fd9cg4rtc3b.apps.googleusercontent.com", "tjhUiABG1ccRZl5W1e54Kq2j", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end

