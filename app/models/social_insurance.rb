class SocialInsurance < ActiveRecord::Base
  attr_accessible :percentage
  validates_numericality_of :percentage, :greater_than => 0.1, :less_than => 31
end
