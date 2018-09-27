class Language < ApplicationRecord
  validates_presence_of :name

  belongs_to :city
end
