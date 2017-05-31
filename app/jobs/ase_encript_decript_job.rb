
class AseEncriptDecriptJob < ActiveJob::Base
  
  require 'openssl'
  require 'base64'

  def self.encryption(att)
    begin
      cipher = OpenSSL::Cipher.new(CONFIG["ALGORITHM"])
      cipher.encrypt()
      cipher.key =  CONFIG["BASE_KEY"]
      crypt = cipher.update(att) + cipher.final()
      crypt_string = (Base64.encode64(crypt))
      return crypt_string
    rescue Exception => exc
      puts ("Message for the encryption log file for message #{att} = #{exc.message}")
    end
  end

  def self.decryption(att)
    begin
      cipher = OpenSSL::Cipher.new(CONFIG["ALGORITHM"])
      cipher.decrypt()
      cipher.key =  CONFIG["BASE_KEY"]
      tempkey = Base64.decode64(att)
      crypt = cipher.update(tempkey)
      crypt << cipher.final()
      return crypt
    rescue Exception => exc
      puts ("Message for the decryption log file for message #{att} = #{exc.message}")
    end
  end
end

