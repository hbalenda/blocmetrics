RSpec.describe RegisteredAppsController, type: :controller do
  before(:each) do
  @user = FactoryGirl.create(:user)
  sign_in @user
  @my_app = FactoryGirl.create(:registered_app)
  @user.registered_apps << @my_app
end

  describe "GET index" do
    it "returns HTTP success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns RegisteredApp.all to @registered_apps" do
      get :index
      expect(assigns(:registered_apps)).to eq([@my_app])
    end
  end

  describe "GET show" do
    it "returns HTTP success" do
      get :show, {id: @my_app.id}
      expect(response).to have_http_status(:success)
    end

    it "assigns @my_app to @registered_app" do
      get :show, {id: @my_app.id}
      expect(assigns(:registered_app)).to eq(@my_app)
    end

    it "renders the show view" do
      get :show, {id: @my_app.id}
      expect(response).to render_template :show
    end
  end

  describe "POST create" do
    it "increases the number of apps by 1" do
      expect { post :create, {registered_app: {name: Faker::Company.name, url: Faker::Internet.url}}}.to change(RegisteredApp,:count).by(1)
    end

    it "assigns RegisteredApp.last to @registered_app" do
      post :create, {registered_app: {name: Faker::Company.name, url: Faker::Internet.url}}
      expect(assigns(:registered_app)).to eq RegisteredApp.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the app" do
      delete :destroy, {id: @my_app.id}
      count = RegisteredApp.where({id: @my_app.id}).size
      expect(count).to eq 0
    end

    it "redirects to index view" do
      delete :destroy, {id: @my_app.id}
      expect(response).to redirect_to registered_apps_path
    end
  end
end
