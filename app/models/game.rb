class Game < ApplicationRecord
  belongs_to :user
  has_many :tables, dependent: :destroy
end
