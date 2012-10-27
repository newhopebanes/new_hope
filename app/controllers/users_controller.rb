class UsersController < ApplicationController
  before_filter :verify_is_admin, :only => [:new, :edit, :create, :update, :destroy]
  
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end
end

private
def verify_is_admin
  if admin
    return
  else
    redirect_to home_path
  end
end