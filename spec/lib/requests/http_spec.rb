require 'rails_helper'

RSpec.describe Requests::Http do
  describe "#base" do
    context "When you want to create an object with the url and headers to make a request" do
      it "Should be created under the faraday class" do
        response = described_class.base("https://www.google.com")

        expect(response.headers).to eq({"User-Agent"=>"Faraday v2.7.4"})
      end
    end
  end
end
