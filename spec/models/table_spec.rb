require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:columns) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(16) }
  end
end
