require 'rails_helper'

describe 'Job Service' do
  before :each do
    # Populate database with seed information
    @city_list = ['Boston', 'Boulder', 'Chicago', 'Denver', 'Los Angeles', 'New York', 'San Francisco']

    @city_list.each do |city_name|
      City.create!(name: city_name)
    end
  end

  describe 'pings the github job API' do
    it 'returns the jobs for each city' do
      JobService.get_jobs
      cities = City.all

      # Expect Boston to have 1 job
      expect(cities[0].jobs.count).to eq(1)

      # # Expect Boulder to have 1 job
      expect(cities[1].jobs.count).to eq(1)

      # Expect Chicago to have 4 jobs
      expect(cities[2].jobs.count).to eq(4)

      # Expect Denver to have 1 job
      expect(cities[3].jobs.count).to eq(1)

      # Expect Los Angeles to have 2 jobs
      expect(cities[4].jobs.count).to eq(1)

      # Expect New York to have 10 jobs
      expect(cities[5].jobs.count).to eq(10)

      # Expect San Fran to have 22 jobs
      expect(cities[6].jobs.count).to eq(21)
    end
  end
end
