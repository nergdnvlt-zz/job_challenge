require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :job_type }
    it 'initiates with enum' do
      boston = City.create!(name: 'Boston')
      job = boston.jobs.create!(title: 'Dev', job_type: 'Full Time', language: 'Scala')

      expect(job.language).to eq('Scala')
    end
  end

  describe 'relationships' do
    it { should belong_to :city }
  end
end
