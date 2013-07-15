class Movie < ActiveRecord::Base
  validates_numericality_of :rating, :greater_than_or_equal_to => 0
  validates_numericality_of :rating, :less_than_or_equal_to => 100
end