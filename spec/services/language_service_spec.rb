require 'rails_helper'

describe 'Language Service' do
  describe 'pings the github job API' do
    it 'returns the jobs for each city' do
      boston = City.create!(name: 'Boston')

      language_list = ['Go', 'JavaScript', 'Python', 'Ruby', 'Scala', 'Other']
      language_list.each do |language|
        boston.languages.create!(name: language)
      end

      response = LanguageService.jobs_by_language(boston)
      binding.pry
      # Testing for JSON response
      expect(response).to be_a(Array)
      expect(response[0]).to be_a(Hash)
      expect(response.count).to eq(1)

      # Testing for exact values
      expect(response[0][:type]).to eq('Full Time')
      expect(response[0][:title]).to eq('Full Stack Developer')
    end
  end
end
