class Job < ApplicationRecord
  validates_presence_of :title, :job_type

  belongs_to :city

  enum language: ['JavaScript', 'Java', 'Python', 'Ruby', 'Scala', 'Other']
end
