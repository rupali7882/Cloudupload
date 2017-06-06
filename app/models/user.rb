class User < ApplicationRecord

	include ApplicationHelper

	  has_many :conversations, :foreign_key => :sender_id

	mount_uploader :avatar, AvatarUploader
    has_secure_password

	before_create :encript_ep, :confirmation_token 
	# attr_accessor :remember_token, :reset_token,:activation_token

	#  Encripted attributes save in db
	def encript_ep 
		sign_in_data = {
			email: email
		}
		
	    sign_in_data.each do |key,attr_val|
          encrypted_data = AseEncriptDecriptJob::encryption(attr_val)
          self.send("#{key}=",encrypted_data) 
	    end
	end

	# Registration confimation methods
	def email_activate
	    self.email_confirmed = true
	    self.confirm_token = nil
	    save!(:validate => false)
    end

    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    # Rest password methods
    def send_password_reset
	  generate_token(:password_digest)
	  self.reset_sent_at = Time.zone.now
	  save!
	  email = decript_string(self.email)
	  UserMailer.password_reset(self,email).deliver
	end

    def generate_token(field)
	  begin
	    self[field] = SecureRandom.urlsafe_base64
	  end while User.exists?(field => self[field])
	end
	   


end

