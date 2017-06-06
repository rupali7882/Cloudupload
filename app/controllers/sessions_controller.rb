class SessionsController < ApplicationController

  def new
  end

 
  def create
      user = User.find_by_email(encript_string(params[:email]))
      if user && user.authenticate(params[:password])
        if user.email_confirmed
            session[:user_id] = user.id
            flash[:success] = "Loggin suceessfully"
            redirect_to orders_url
        else
          flash.now[:error] = 'Please activate your account by following the 
          instructions in the account confirmation email you received to proceed'
          render 'new'
        end
      else
        flash.now[:error] = 'Invalid email/password combination' 
        render 'new'
      end
  end

  def destroy
  	session[:user_id] = nil
    flash[:success] = "LogOut suceessfully"
    redirect_to '/'
  end
end

