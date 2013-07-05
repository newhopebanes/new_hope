module EventDateHelper
  def this_week?
    complex_date.this_week?
  end
  
  def this_month?
    complex_date.this_month?
  end
  
  def today?
    complex_date.today?
  end
end