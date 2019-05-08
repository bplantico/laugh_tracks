# app/models/comedian.rb

class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :city

  def self.by_age(age)
    where(age: age.to_i)
  end

  def self.average_age(age = nil)
    if age == nil
      average(:age).to_i
    else
      by_age(age).average(:age).to_i
      # if you make the change noted in the controller, you won't need to redo the 'by_age' here, you could just call 'average(:age).to_i' on the subset of Comedians
    end
  end

  def self.cities(for_whom_are_yrs_old = nil)
    # require "pry"; binding.pry
    if for_whom_are_yrs_old == nil
      select(:city).distinct(:city).pluck(:city).join(", ")
    else
      by_age(for_whom_are_yrs_old).select(:city).distinct(:city).pluck(:city).join(", ")
      # similar to above, if you make the change in the controller, you won't need to re-filter by_age
    end

  end

end
