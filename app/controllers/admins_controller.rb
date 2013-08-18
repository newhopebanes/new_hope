class AdminsController < ApplicationController
  before_filter :verify_is_admin
  # GET /admins
  # GET /admins.json
  def index
    @admin = Admin.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin }
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end


  # GET /admins/1/edit
  def edit
    @admin = Admin.first
  end


  # PUT /admins/1
  # PUT /admins/1.json
  def update
    @admin = Admin.first

    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        format.html { redirect_to @admin, notice: 'Website data was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

end
private
def verify_is_admin
  if admin
    return
  else
    redirect_to about_path
  end
end