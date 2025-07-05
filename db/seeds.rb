# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.destroy_all

User.create!(
  username: "alice",
  avatar_url: "https://i.pravatar.cc/150?img=1"
)

User.create!(
  username: "bob",
  avatar_url: "https://i.pravatar.cc/150?img=2"
)

User.create!(
  username: "carla",
  avatar_url: "https://i.pravatar.cc/150?img=3"
)

Gym.create([
  { name: 'Fitness Hut Lisboa', latitude: 38.7266, longitude: -9.1522, avatar_url: 'https://example.com/fitness_hut.png' },
  { name: 'Solinca Lisboa', latitude: 38.7127, longitude: -9.1391, avatar_url: 'https://example.com/solinca.png' },
  { name: 'Holmes Place Lisbon', latitude: 38.7139, longitude: -9.1479, avatar_url: 'https://example.com/holmes_place.png' }
])
