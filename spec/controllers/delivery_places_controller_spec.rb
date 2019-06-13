require 'rails_helper'
require 'spec_helper'

RSpec.describe DeliveryPlacesController, :type => :controller do
  describe "GET index" do
    it "returns table with all delivey places" do
      get 'index', params: {}
      expect(response.status).to eq(200)
    end
  end
end
