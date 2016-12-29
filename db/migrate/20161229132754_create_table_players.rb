class CreateTablePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :table_players do |t|
      t.references :table, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
