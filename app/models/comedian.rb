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
    end
  end

  def self.cities(for_whom_are_yrs_old = nil)
    # require "pry"; binding.pry
    if for_whom_are_yrs_old == nil
      select(:city).distinct(:city).pluck(:city).join(", ")
    else
      by_age(for_whom_are_yrs_old).select(:city).distinct(:city).pluck(:city).join(", ")
    end

  end

end
