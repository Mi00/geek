json.extract! table, :id, :name, :owner, :game_id, :user_id, :event_id, :created_at, :updated_at
json.url table_url(table, format: :json)