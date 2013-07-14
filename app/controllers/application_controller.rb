class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :get_updated

  def get_updated
  	@updated = Update.last().display_date
  end

  def record_update
    u = Update.new({:action => action_name, :area => controller_name, :user => current_user, :description => item_name})
    u.save
  end

  private

  def item_name
    if controller_name == 'events'
      return @event.name
    end
    if controller_name == 'groups'
      return @group.name
    end
    'unknown'
  end
end
