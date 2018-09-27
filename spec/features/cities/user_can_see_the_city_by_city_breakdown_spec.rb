require 'rails_helper'

describe 'User visits the root page' do
  before :each do
    # Populate database with seed information
    @city_list = ['Boston', 'Boulder', 'Chicago', 'Denver', 'Los Angeles', 'New York', 'San Francisco']
    @city_list.each do |city_name|
      City.create!(name: city_name)
    end
  end

  describe 'to see a breakdown of the cities' do
    it 'has all the cities listed' do
      # User visits the root page
      visit '/'

      # The page has all the cities listed
      @city_list.each do |city_name|
        expect(page).to have_content(city_name.name)
      end
    end
  end
end
