class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  before_filter :verify_is_admin, :only => [:new, :edit, :create, :update, :destroy]
  
  def index
    if params[:tag]
      @events = Event.for_tag(params[:tag])
    elsif params[:target]
      @events = Event.for_target(params[:target])
    elsif params[:day]
      temp = Event.all
      @events = Array.new
      
      temp.each do |e|
        if e.today?
          @events << e
        end
      end
    elsif params[:week]
      temp = Event.all
      @events = Array.new
      
      temp.each do |e|
        if e.this_week?
          @events << e
        end
      end
    elsif params[:month]
      temp = Event.all
      @events = Array.new
      
      temp.each do |e|
        if e.this_month?
          @events << e
        end
      end
    else
      @events = Event.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new

      @event = Event.new
      @event.tagset = Tagset.new
      @event.targetset = Targetset.new
      @event.address = Address.new
      @event.complex_date = ComplexDate.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @event }
      end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    

    respond_to do |format|
      if @event.save
        puts "SUCESS"
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        puts "FAILURE"
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end



  
end

private
def verify_is_admin
  if admin
    return
  else
    redirect_to events_path
  end
end
