require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/workspaces", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Workspace. As you add validations to Workspace, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Workspace.create! valid_attributes
      get workspaces_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      workspace = Workspace.create! valid_attributes
      get workspace_url(workspace)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_workspace_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      workspace = Workspace.create! valid_attributes
      get edit_workspace_url(workspace)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Workspace" do
        expect {
          post workspaces_url, params: { workspace: valid_attributes }
        }.to change(Workspace, :count).by(1)
      end

      it "redirects to the created workspace" do
        post workspaces_url, params: { workspace: valid_attributes }
        expect(response).to redirect_to(workspace_url(Workspace.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Workspace" do
        expect {
          post workspaces_url, params: { workspace: invalid_attributes }
        }.to change(Workspace, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post workspaces_url, params: { workspace: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested workspace" do
        workspace = Workspace.create! valid_attributes
        patch workspace_url(workspace), params: { workspace: new_attributes }
        workspace.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the workspace" do
        workspace = Workspace.create! valid_attributes
        patch workspace_url(workspace), params: { workspace: new_attributes }
        workspace.reload
        expect(response).to redirect_to(workspace_url(workspace))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        workspace = Workspace.create! valid_attributes
        patch workspace_url(workspace), params: { workspace: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested workspace" do
      workspace = Workspace.create! valid_attributes
      expect {
        delete workspace_url(workspace)
      }.to change(Workspace, :count).by(-1)
    end

    it "redirects to the workspaces list" do
      workspace = Workspace.create! valid_attributes
      delete workspace_url(workspace)
      expect(response).to redirect_to(workspaces_url)
    end
  end
end
