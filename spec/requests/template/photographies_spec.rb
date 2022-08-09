require 'rails_helper'

RSpec.describe "Template::Photographies", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/template/photographies/create"
      expect(response).to have_http_status(:success)
    end
  end

end
