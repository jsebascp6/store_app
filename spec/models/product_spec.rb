require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to respond_to(:rating) }
    it { is_expected.to respond_to(:category) }
    it { is_expected.to respond_to(:quantity_available) }
    it { is_expected.to respond_to(:price) }
    it { is_expected.to respond_to(:image) }
  end
end
