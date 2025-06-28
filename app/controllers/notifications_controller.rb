require 'ostruct'



class NotificationsController < ApplicationController
  def index
    # Temporary dummy data for UI testing until you add real notifications
    @notifications = [
      OpenStruct.new(
        user: OpenStruct.new(username: "jessica", avatar_url: nil),
        message: " started following you.",
        created_at: 5.minutes.ago,
        action: "follow"
      ),
      OpenStruct.new(
        user: OpenStruct.new(username: "mikefit", avatar_url: nil),
        message: " liked your post.",
        created_at: 1.hour.ago,
        action: "like"
      )
    ]
  end
end
