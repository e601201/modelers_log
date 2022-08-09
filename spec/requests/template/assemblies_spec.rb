require 'rails_helper'

RSpec.describe "Template::Assemblies", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/template/assemblies/create"
      expect(response).to have_http_status(:success)
    end
  end

end
