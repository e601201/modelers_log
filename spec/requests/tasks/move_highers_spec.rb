require 'rails_helper'

RSpec.describe "Tasks::MoveHighers", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/tasks/move_highers/update"
      expect(response).to have_http_status(:success)
    end
  end

end
