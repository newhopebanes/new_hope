class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :tags
  has_many :target
  belongs_to :day
  belongs_to :frequency
  belongs_to :referral
  
  validates :name, :presence => true
  validates :organisation,  :presence => true
  validates :cost, :presence => true
  validates :access,  :presence => true
  validates :referral_process, :presence => true
  validates :aimed_at,  :presence => true
  
  
  
  before_save :cleanup
  
  scope :all_lazy, select('*')
  scope :all_ordered_last, all_lazy.order("last_name ASC")
  
  def name
    "#{first_name} #{last_name}"
  end

  private
  
  def cleanup
    self[:first_name] = self[:first_name].capitalize
  end
end
