class SuggestionsController < ApplicationController
  def create
    content = params[:content]
    # Do something with content, like save to DB or send email

    flash[:notice] = "Thanks for your suggestion!"
    redirect_back fallback_location: root_path
  end
end