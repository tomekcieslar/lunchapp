require 'rails_helper'
require 'spec_helper'

RSpec.describe SearchController, :type => :controller do
  describe "GET index" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end

  end

end
