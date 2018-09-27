require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :type }
  end

  describe 'relationships' do
    it { should belong_to :language }
  end
end
