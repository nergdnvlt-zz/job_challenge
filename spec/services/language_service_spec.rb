require 'rails_helper'

describe 'Language Service' do
  describe 'pings the github job API' do
    it 'returns the jobs for each city' do
      boston = City.create!(name: 'Boston')

      language_list = ['Go', 'JavaScript', 'Python', 'Ruby', 'Scala']
      language_list.each do |language|
        boston.languages.create!(name: language)
      end

      languages = LanguageService.jobs_by_language(boston)
      # Testing for JSON response
      expect(languages).to be_a(Array)
      expect(languages[0].name).to eq('Go')
      expect(languages[0].jobs.count).to eq(0)

      expect(languages[1].name).to eq('JavaScript')
      expect(languages[1].jobs.count).to eq(0)

      expect(languages[2].name).to eq('Python')
      expect(languages[2].jobs.count).to eq(1)

      expect(languages[3].name).to eq('Ruby')
      expect(languages[3].jobs.count).to eq(0)

      expect(languages[4].name).to eq('Scala')
      expect(languages[4].jobs.count).to eq(1)
    end
  end
end
