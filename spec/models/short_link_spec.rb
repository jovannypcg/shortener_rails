require 'rails_helper'

RSpec.describe ShortLink, type: :model do
  it 'has a valid factory' do
    short_link = FactoryGirl.create(:short_link)
    expect(short_link).to be_valid
  end

  context 'ShortLink has invalid data' do
    let(:short_link_no_destination) { FactoryGirl.build(:short_link, destination: nil) }
    let(:short_link_empty_destination) { FactoryGirl.build(:short_link, destination: '') }
    let(:short_link_invalid_destination) { FactoryGirl.build(:short_link, destination: 'blahblah') }

    it 'is not valid when no destination provided' do
      expect(short_link_no_destination).to_not be_valid
    end

    it 'is not valid when empty string as destination is provided' do
      expect(short_link_empty_destination).to_not be_valid
    end

    it 'is not valid when any string as destination is provided' do
      expect(short_link_invalid_destination).to_not be_valid
    end
  end
end
