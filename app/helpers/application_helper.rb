module ApplicationHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to '/dashboard' unless current_user
  end


  def encript_string str
 	 return AseEncriptDecriptJob::encryption(str)
  end

   def decript_string str
  	return AseEncriptDecriptJob::decryption(str)
  end

  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end



end
