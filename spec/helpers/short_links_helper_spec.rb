require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ShortLinksHelper. For example:
#
# describe ShortLinksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ShortLinksHelper, type: :helper do
  let(:short_link) { FactoryGirl.create(:short_link) }

  before(:each) do
    helper.request.host = 'localhost:3000'
  end

  describe '#slug_info' do
    it 'includes href to slug url' do
      html_slug_info = helper.slug_info(short_link.slug)
      slug_url = "#{helper.request.host_with_port}/#{short_link.slug}"

      expect(html_slug_info).to include("://#{slug_url}")
    end
  end
end
