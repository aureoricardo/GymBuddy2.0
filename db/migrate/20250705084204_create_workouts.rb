class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.string :video_url
      t.text :description

      t.timestamps
    end
  end
end
