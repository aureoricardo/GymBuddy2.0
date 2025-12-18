class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # This is your public welcome page
  end
end
