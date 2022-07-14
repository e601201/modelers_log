require "rails_helper"

RSpec.describe WorkspacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/workspaces").to route_to("workspaces#index")
    end

    it "routes to #new" do
      expect(get: "/workspaces/new").to route_to("workspaces#new")
    end

    it "routes to #show" do
      expect(get: "/workspaces/1").to route_to("workspaces#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/workspaces/1/edit").to route_to("workspaces#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/workspaces").to route_to("workspaces#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/workspaces/1").to route_to("workspaces#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/workspaces/1").to route_to("workspaces#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/workspaces/1").to route_to("workspaces#destroy", id: "1")
    end
  end
end
