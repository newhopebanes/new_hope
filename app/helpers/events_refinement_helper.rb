module EventsRefinementHelper
	attr_accessor :result, :parameters, :search
  # Refine and return a list of events based on parameters passed in the request
  def get_events parameter_list

    return all unless parameter_list
    
    self.result = all
    self.parameters = parameter_list
    self.search = Search.new

    remove_past_events
    refine_cost
    refine_tags
    refine_target
    refine_referral
    refine_quickdate
    refine_date
    result.sort! { |a,b| a.complex_date.fixed_date <=> b.complex_date.fixed_date }
    self.result
  end

  def remove_past_events
    self.result.keep_if do |e|
      e.complex_date.fixed_date >= Date.today
    end
  end

  private

    def refine_cost
      if self.search.cost.include?(self.parameters[:cost])

        self.result.keep_if do |e|
          if e.cost.downcase.strip == 'free'
            true
          
          elsif self.parameters[:cost] == 'less'
            result = /(\d+)\.*(\d*)/.match(e.cost)
            true if result and result[1].to_i <= 5
          
          elsif self.parameters[:cost] == 'more'
            result = /(\d+)\.*(\d*)/.match(e.cost)
            true if result and result[1].to_i >= 5
          end
        end
      end
    end



    def refine_tags
      if self.search.taglist.include?(self.parameters[:tag])

        self.result.keep_if do |e|
          e.tagset[self.parameters[:tag]] == true
        end
      end
    end

    def refine_target
      if self.parameters[:target]

        self.result.keep_if do |e|
          result = true
          tags = []
          self.parameters[:target].each do |t|
            tags << t.first
          end
          tags.each do |t|
            unless e.targetset[t] == true
              result = false
            end
          end
          result
        end
      end
    end

    def refine_referral
      if self.search.referrallist.include?(self.parameters[:referral])

        index = self.search.referrallist.index(self.parameters[:referral]) + 1
        self.result.keep_if do |e|
          e.referral.position == index
        end
      end
    end

    def refine_date
      if self.parameters.include?(:date) and self.parameters[:date].length == 10 

        self.result.keep_if do |e|
          e.complex_date.fixed_date == Date.parse(self.parameters[:date])
        end
      end
    end

    def create_date_from_params
      r = self.parameters[:date].split(/((\d+)[\/](\d+)[\/](\d+))/)
      Date.parse("#{r[4]}-#{r[2]}-#{r[3]}")
    end

    def refine_quickdate
      if self.search.quick_date.include?(self.parameters[:quick_date])

        search = self.parameters[:quick_date]

        if search == 'day'
          self.result.keep_if do |e|
            e.today?
          end
        end

        if search == 'week'
          self.result.keep_if do |e|
            e.this_week?
          end
        end

        if search == 'month'
          self.result.keep_if do |e|
            e.this_month?
          end
        end
      end

    end
end