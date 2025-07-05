require 'ostruct'  # Add this at the top if not already present

class PagesController < ApplicationController
  def home
  end
  
  def workouts
  end

  def profile
    @user = OpenStruct.new(
      username: "fit_john",
      avatar_url: "https://randomuser.me/api/portraits/men/75.jpg",
      bio: "Fitness enthusiast • Deadlifts & protein 🏋️‍♂️🥤"
    )

    @posts = Array.new(9) do
      OpenStruct.new(image_url: " https://picsum.photos/seed/#{rand(1000)}/300/300")
    end

    def profile_tab
  Rails.logger.debug "Loading tab: #{params[:tab]}"
  
  @posts = Array.new(9) do
    OpenStruct.new(image_url: " https://picsum.photos/seed/#{rand(1000)}/300/300")
  end

  case params[:tab]
  when 'tagged'
    render partial: 'profile_tagged', formats: [:html]
  when 'saved'
    render partial: 'profile_saved',  formats: [:html]
  else
    render partial: 'profile_posts',  formats: [:html]
  end
end

  
  
  
  
  
  end

  def messages 
  end 

  def notifications
  end
  
  def settings 
  end 
end
