class UserMailer < ActionMailer::Base
    default :from => "me@mydomain.com"
	 def registration_confirmation(user,email)
	    @user = user
	    mail(:to => email, :subject => "Registration Confirmation")
	 end

	 def password_reset(user,email)
	   @user = user
	   mail :to => email, :subject => "Password Reset"
	 end

end