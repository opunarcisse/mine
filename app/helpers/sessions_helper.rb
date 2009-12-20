module SessionsHelper
  def logged_in?
    !session[:user_id].nil?
    return session[:user_id]
    
  end

  def user_logged_in?
    if logged_in?
   user = User.find(logged_in?)
   return user
    end

  end
end
