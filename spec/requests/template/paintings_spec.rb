require 'rails_helper'

RSpec.describe "Template::Paintings", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/template/paintings/create"
      expect(response).to have_http_status(:success)
    end
  end

end
