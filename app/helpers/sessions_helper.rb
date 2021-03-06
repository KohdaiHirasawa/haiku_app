module SessionsHelper

  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id:session[:user_id])
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  def logged_in?
    !current_user.nil?
  end
  def currentuser_correct?
    @user.id == session[:user_id]
  end
end
