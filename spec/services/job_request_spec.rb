require 'rails_helper'

describe 'Job Request' do
  describe 'pings the github job API' do
    it 'returns the jobs for each city' do
      response = JobRequest.jobs('Boston', 'Scala')

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
