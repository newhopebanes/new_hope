module SessionsHelper
  
  def sign_in(user)
    session[:remember_token] = user.id
  end
  
  def admin
    value = false
    if session[:remember_token] then
      user = User.find(session[:remember_token])
      value = user != nil
    end
    value
  end
  
end
