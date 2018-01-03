class RegisteredApplicationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url  = params[:registered_application][:url]
    @registered_application.user_id = current_user.id

    if @registered_application.save
      flash[:notice] = "#{@registered_application.name} was registered succesfully"
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error registering the app. Please try again."
      redirect_to action: :index
    end
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def update
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      redirect_to action: :index
    end

  end

end
