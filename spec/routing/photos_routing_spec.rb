require "rails_helper"

RSpec.describe PhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/photos").to route_to("photos#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/photos/1").to route_to("photos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/photos").to route_to("photos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/photos/1").to route_to("photos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/photos/1").to route_to("photos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/photos/1").to route_to("photos#destroy", id: "1")
    end
  end
end
