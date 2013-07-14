module SessionsHelper

  def sign_in(user)
    session[:remember_token] = user.id
  end

  def sign_out
    session[:remember_token] = nil
  end

  def admin
    value = false
    if session[:remember_token] then
      user = User.find(session[:remember_token])
      value = user != nil
    end
    value
  end

  def current_user
    value = 'unknown'
    if session[:remember_token] then
      user = User.find(session[:remember_token])
      value = user.name
    end
    value
  end

end
