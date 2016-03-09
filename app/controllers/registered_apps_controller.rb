class RegisteredAppsController < ApplicationController


  def index
    @registered_apps = RegisteredApp.all
  end

  def show
    @registered_app = RegisteredApp.find(params[:id])
  end

  def new
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = RegisteredApp.new(registered_app_params)
    @registered_app.user = current_user
    if @registered_app.save
      redirect_to registered_apps_path
    else
      flash[:alert] = "There was a problem saving your application. Please make sure you are regsitering a unique URL."
      redirect_to registered_apps_path
    end
  end

  def destroy
    @registered_app = RegisteredApp.find(params[:id])
    if @registered_app.destroy
      redirect_to registered_apps_path
    end
  end

  private

  def registered_app_params
    params.require(:registered_app).permit(:name, :url)
  end
end
