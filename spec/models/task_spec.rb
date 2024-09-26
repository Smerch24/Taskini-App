require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:column) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:priority) }
    it { should validate_length_of(:description).is_at_least(2) }
    it { should validate_length_of(:description).is_at_most(120) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should define_enum_for(:status) }
    it { should define_enum_for(:priority) }
  end
end
