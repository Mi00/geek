class Table < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :table_players
  belongs_to :event
end
