require 'rails_helper'

RSpec.describe "Tasks::MoveLowers", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/tasks/move_lowers/update"
      expect(response).to have_http_status(:success)
    end
  end

end
