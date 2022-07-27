require 'rails_helper'

RSpec.describe "Followings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/followings/index"
      expect(response).to have_http_status(:success)
    end
  end

end
