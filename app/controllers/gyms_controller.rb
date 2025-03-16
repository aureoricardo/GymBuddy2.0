class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gyms_params)
    @gym.save
    redirect_to (@gyms_path)
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    @gym.update (gyms_params)
    redirect_to gyms_path (@gyms)
  end
  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to gyms_path, status: :see_other
  end

  private

  def gyms_params
    params.require(:gym).permit(:name, :address, :rating)
  end
end
