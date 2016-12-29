class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.time :game_time
      t.string :lang
      t.string :description
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
