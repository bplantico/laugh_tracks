# app/models/special.rb

class Special < ApplicationRecord
  belongs_to :comedian

  validates_presence_of :name, :run_time, :comedian_id
  # with belongs_to, you don't need to validate a comedian_id - the relationship itself is going to requre a comedian on a special.
end
