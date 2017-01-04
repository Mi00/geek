class Table < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :table_players, dependent: :destroy
  belongs_to :event
  has_many :comments, dependent: :destroy
end
