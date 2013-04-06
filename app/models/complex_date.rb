class ComplexDate < ActiveRecord::Base
  attr_accessible :event_id, :date_type_id, :fixed_date,
                  :time, :offset_type_id, :fixed_offset_id,
                  :dynamic_offset_id, :frequency_id, :fixed_frequency_id,
                  :day_id, :date_type_attributes, :offset_type_attributes,
                  :fixed_offset_attributes, :dynamic_offset_attributes,
                  :frequency_attributes, :fixed_frequency_attributes, :day_attributes
  belongs_to :event
  belongs_to :date_type
  belongs_to :offset_type
  belongs_to :fixed_offset
  belongs_to :dynamic_offset
  belongs_to :frequency
  belongs_to :fixed_frequency
  belongs_to :day
  accepts_nested_attributes_for :date_type, :offset_type, :fixed_offset, :dynamic_offset, :frequency, :fixed_frequency, :day
  
  def month
    fixed_date.month || 0
  end

  def this_week?
    today = Date.today
    start_of_week = today.prev_day(calculate_start_day(today))
    end_of_week = today.next_day(calculate_end_day(today))
    # puts "Today: #{today}"
    # puts "start_of_week: #{start_of_week}"
    # puts "end_of_week: #{end_of_week}"
    # puts "fixed_date: #{fixed_date}"
    fixed_date >=  start_of_week and fixed_date <= end_of_week
  end

  def this_month?
    today = Date.today
    fixed_date.month == today.month
  end
  
  def today?
    today = Date.today
    fixed_date == today
  end

  private
  def calculate_start_day day
    return 6 if day.wday == 0
    6 - (7 - day.wday)
  end

  def calculate_end_day day
    return 0 if day.wday == 0
    7 - day.wday
  end
  
end
