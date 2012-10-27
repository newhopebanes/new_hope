class SessionsController < ApplicationController
  def new

  end
  
  def create
    user = User.find_by_name(params[:session][:name].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
              redirect_to '/home'
      else
        flash.now[:error] = 'Not a valid password'
              render 'new'
      end
  end
  
  def destroy
    
  end
end
