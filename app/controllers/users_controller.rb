class UsersController < ApplicationController

	def new
	end

	def create
	  user = User.new(user_params)
	  if user.save
	    # session[:user_id] = user.id
      email = decript_string(user.email)
	    UserMailer.registration_confirmation(user,email).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to root_url
	  else
	    redirect_to '/signup'
	  end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to '/'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_url
    end
	end

  def password_reset_submit
    user = User.find_by_email(encript_string params[:email])
    if user
      user.send_password_reset
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit_password_reset
     @user = User.find_by_password_digest!(params[:id])
  end

  def password_update
    @user = User.find_by_password_digest!(params[:id])
    if @user.reset_sent_at < 2.hours.ago
      redirect_to password_reset_submit_users_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(user_params)
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit_password_reset
    end

  end
	
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
