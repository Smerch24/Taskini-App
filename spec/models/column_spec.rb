require 'rails_helper'

RSpec.describe Column, type: :model do
  describe 'associations' do
    it { should belong_to(:table) }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(16) }
  end
end
