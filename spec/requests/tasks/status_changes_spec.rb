require 'rails_helper'

RSpec.describe "Tasks::StatusChanges", type: :request do
  describe "GET /update" do
    it "returns http success" do
      get "/tasks/status_changes/update"
      expect(response).to have_http_status(:success)
    end
  end

end
