class Job < ApplicationRecord
  validates_presence_of :title, :job_type

  belongs_to :language
end
