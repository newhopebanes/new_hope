class Search


  def initialize
  end

  def taglist
    %w[arts sports outdoors creative wellbeing social faith food learning exercise lifestyle]
  end

  def targetlist
    %w[adults under_18 men women mental_health learning_difficulties drug_alcohol homelessness carers
      carers_mental_health vulnerable anyone]
  end

  def referrallist
    %w[1 2 3]  #[Proffessional, Self, Other]
  end

  def quick_date
    %w[day week month]
  end

  def cost
    %w[free less more]
  end



end