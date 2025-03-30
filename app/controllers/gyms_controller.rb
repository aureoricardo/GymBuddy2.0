class GymsController < ApplicationController
before_action :set_gym, only: [:show,:edit,:update,:destroy]

  def index
    @gyms = Gym.all
  end

  def show
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(gyms_params)
    @gym.save
    redirect_to gyms_path (@gyms_path)
  end

  def edit
  end

  def update
    @gym.update (gyms_params)
    redirect_to gyms_path (@gyms)
  end

  def destroy
    @gym.destroy
    redirect_to gyms_path, status: :see_other
  end

  private

  def gyms_params
    params.require(:gym).permit(:name, :address, :rating)
  end

  def set_gym
    @gym = Gym.find(params[:id])
  end
end
