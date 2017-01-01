class Table < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :table_players
  belongs_to :event
  has_many :comments
end
