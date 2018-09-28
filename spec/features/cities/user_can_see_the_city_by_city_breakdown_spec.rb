require 'rails_helper'

describe 'User visits the root page' do
  before :each do
    # Populate database with seed information
    @city_list = ['Boston', 'Boulder', 'Chicago', 'Denver', 'Los Angeles', 'New York', 'San Francisco']

    @city_list.each do |city_name|
      City.create!(name: city_name)
    end
  end

  # describe 'to see a breakdown of the cities' do
  #   it 'has all the cities listed' do
  #     # User visits the root page
  #     visit '/'
  #
  #     # The page has all the cities listed
  #     @city_list.each do |city_name|
  #       expect(page).to have_content(city_name)
  #     end
  #   end
  # end

  describe 'to see a breakdown of languages for each city' do
    it 'has all the languages for each city listed' do
      # User visits the root page
      JobService.get_jobs
      jobs = Job.all

      visit '/'

      # The page has the percentages for the first city
      within(first('.city')) do
        expect(page).to have_content('JavaScript')
        expect(page).to have_content('Java')
        expect(page).to have_content('Full Time: 100%')
        expect(page).to have_content('Python')
        expect(page).to have_content('Ruby')
        expect(page).to have_content('Scala')
        expect(page).to have_content('Other')
      end
    end
  end
end
