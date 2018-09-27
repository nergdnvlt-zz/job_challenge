class Job < ApplicationRecord
  validates_presence_of :title, :type

  belongs_to :language
end
