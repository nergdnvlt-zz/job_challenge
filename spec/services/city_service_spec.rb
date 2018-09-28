require 'rails_helper'

describe 'City Service' do
  describe 'sends the raw jobs to be database objects' do
    it 'returns the cities actual job objects' do
      boston = City.create!(name: 'Boston')
      jobs = CityService.jobs(boston)

      expect(jobs[0].title).to eq('Full Stack Developer')
      expect(jobs[0].job_type).to eq('Full Time')
      expect(jobs[0].language).to eq('Java')
    end
  end
end
