require 'rails_helper'

describe 'User visits the root page' do
  before :each do
    # Populate database with seed information
    @city_list = ['Boston', 'Boulder', 'Chicago', 'Denver', 'Los Angeles', 'New York', 'San Francisco']
    @language_list = ['Go', 'JavaScript', 'Python', 'Ruby', 'Scala', 'Other']

    @city_list.each do |city_name|
      city = City.create!(name: city_name)
      @language_list.each do |language|
        city.languages.create!(name: language)
      end
    end
  end

  describe 'to see a breakdown of the cities' do
    it 'has all the cities listed' do
      # User visits the root page
      visit '/'

      # The page has all the cities listed
      @city_list.each do |city_name|
        expect(page).to have_content(city_name)
      end
    end
  end

  describe 'to see a breakdown of languages for each city' do
    it 'has all the languages for each city listed' do
      # User visits the root page
      visit '/'

      # The page has all the cities listed
      @language_list.each do |language|
        expect(page).to have_content(language)
      end
      expect(page).to have_content('Full Time')
      expect(page).to have_content('Part Time')
      expect(page).to have_content('Unknown')
    end
  end
end
