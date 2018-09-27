require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :city }
    it { should have_many :jobs }
  end
end
