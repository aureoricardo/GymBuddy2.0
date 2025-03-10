class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end
end

  def show
    @gym = Gym.find(params[:id])
  end
