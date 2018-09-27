class City < ApplicationRecord
  validates_presence_of :name

  has_many :languages
end
