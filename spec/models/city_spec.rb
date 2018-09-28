require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :jobs }
  end
end
