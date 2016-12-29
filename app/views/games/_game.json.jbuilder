json.extract! game, :id, :name, :min_players, :max_players, :game_time, :lang, :description, :image_url, :user_id, :created_at, :updated_at
json.url game_url(game, format: :json)