require 'rails_helper'

RSpec.describe "Workspaces::Notifications", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/workspaces/notifications/index"
      expect(response).to have_http_status(:success)
    end
  end

end
