
require 'ostruct'


class MapController < ApplicationController
  def index

    # In your controller:
    @maptiler_key = ENV['MAPTILER_API_KEY']



    # Example structure for @followed_users (replace with your actual data)
    @followed_users = [
    {
      name: "John Doe",
      latitude: 38.7223,
      longitude: -9.1393,
      avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fplatinaline.com%2Fwp-content%2Fuploads%2F2021%2F12%2FWhatsApp-Image-2021-12-29-at-23.56.21.jpeg&f=1&ipt=5bffe98f540962887f274e9b0c104de1325a4e709be6d8f3fd6ad977ef060163"
    },
    # more followed users...
    ]

    gyms_os = [

      
      OpenStruct.new(
        name: "Fitness Factory Lisbon",
        latitude: 38.7217,
        longitude: -9.1390,
        avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcorreiokianda.info%2Fwp-content%2Fuploads%2F2022%2F12%2FPai-Profeta.jpeg&f=1&ipt=f5c46bbdbe6d2997afb218c59a941e1e71db880c96e4e029a1c3f908fb30f245",
        weekly_hours: {
          "Monday" => "6:00 AM - 10:00 PM",
          "Tuesday" => "6:00 AM - 10:00 PM",
          "Wednesday" => "6:00 AM - 10:00 PM",
          "Thursday" => "6:00 AM - 10:00 PM",
          "Friday" => "6:00 AM - 10:00 PM",
          "Saturday" => "8:00 AM - 8:00 PM",
          "Sunday" => "Closed"
        }
      ),
      OpenStruct.new(
        name: "GymX Porto",
        latitude: 41.1496,
        longitude: -8.6109,
        avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcorreiokianda.info%2Fwp-content%2Fuploads%2F2022%2F12%2FPai-Profeta.jpeg&f=1&ipt=f5c46bbdbe6d2997afb218c59a941e1e71db880c96e4e029a1c3f908fb30f245",
        weekly_hours: {
          "Monday" => "7:00 AM - 9:00 PM",
          "Tuesday" => "7:00 AM - 9:00 PM",
          "Wednesday" => "7:00 AM - 9:00 PM",
          "Thursday" => "7:00 AM - 9:00 PM",
          "Friday" => "7:00 AM - 9:00 PM",
          "Saturday" => "9:00 AM - 5:00 PM",
          "Sunday" => "Closed"
        }
      ),
      OpenStruct.new(
        name: "CrossFit Lisboa",
        latitude: 38.7183,
        longitude: -9.1420,
        avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcorreiokianda.info%2Fwp-content%2Fuploads%2F2022%2F12%2FPai-Profeta.jpeg&f=1&ipt=f5c46bbdbe6d2997afb218c59a941e1e71db880c96e4e029a1c3f908fb30f245",
        weekly_hours: {
          "Monday" => "6:30 AM - 9:30 PM",
          "Tuesday" => "6:30 AM - 9:30 PM",
          "Wednesday" => "6:30 AM - 9:30 PM",
          "Thursday" => "6:30 AM - 9:30 PM",
          "Friday" => "6:30 AM - 9:30 PM",
          "Saturday" => "8:00 AM - 6:00 PM",
          "Sunday" => "Closed"
        }
      ),
      OpenStruct.new(
        name: "Holmes Place",
        latitude: 38.7135,
        longitude: -9.1442,
        avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcorreiokianda.info%2Fwp-content%2Fuploads%2F2022%2F12%2FPai-Profeta.jpeg&f=1&ipt=f5c46bbdbe6d2997afb218c59a941e1e71db880c96e4e029a1c3f908fb30f245",
        weekly_hours: {
          "Monday" => "6:00 AM - 11:00 PM",
          "Tuesday" => "6:00 AM - 11:00 PM",
          "Wednesday" => "6:00 AM - 11:00 PM",
          "Thursday" => "6:00 AM - 11:00 PM",
          "Friday" => "6:00 AM - 11:00 PM",
          "Saturday" => "8:00 AM - 8:00 PM",
          "Sunday" => "8:00 AM - 8:00 PM"
        }
      ),
      OpenStruct.new(
        name: "Fitness Hut",
        latitude: 38.7150,
        longitude: -9.1355,
        avatar_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcorreiokianda.info%2Fwp-content%2Fuploads%2F2022%2F12%2FPai-Profeta.jpeg&f=1&ipt=f5c46bbdbe6d2997afb218c59a941e1e71db880c96e4e029a1c3f908fb30f245",
        weekly_hours: {
          "Monday" => "6:00 AM - 10:00 PM",
          "Tuesday" => "6:00 AM - 10:00 PM",
          "Wednesday" => "6:00 AM - 10:00 PM",
          "Thursday" => "6:00 AM - 10:00 PM",
          "Friday" => "6:00 AM - 10:00 PM",
          "Saturday" => "8:00 AM - 6:00 PM",
          "Sunday" => "Closed"
        }
      )
    ]  
    
    # Convert OpenStruct to array of hashes
    @gyms = gyms_os.map(&:to_h)
  end
end

