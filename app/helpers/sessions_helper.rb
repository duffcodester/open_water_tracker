module SessionsHelper
  def store_location
    session[:return_to] = request.url if request.get?
  end

  def current_user?(user)
    user == current_user
  end
end
