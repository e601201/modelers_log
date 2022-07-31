require 'rails_helper'

RSpec.describe "Workspaces::Favorites", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/workspaces/favorites/index"
      expect(response).to have_http_status(:success)
    end
  end

end
