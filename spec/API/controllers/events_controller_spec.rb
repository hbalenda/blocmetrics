require 'rails_helper'

RSpec.describe API::EventsController, type: :controller do
  before(:each) do
  @user = FactoryGirl.create(:user)
  sign_in @user
  @my_app = FactoryGirl.create(:registered_app)
  @user.registered_apps << @my_app
end

  describe "POST create" do
    before do
      controller.request.env['HTTP_ORIGIN'] = @my_app.url
      post :create, event: { name: "A Cool Event" }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns json content type" do
      expect(response.content_type).to eq("application/json")
    end

    it "creates an event with correct attributes" do
      hashed_json = JSON.parse(response.body)
      expect(hashed_json["name"]).to eq("A Cool Event")
    end
  end
end
