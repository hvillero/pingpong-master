class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.datetime :gamed_at
      t.integer :final_points_1
      t.integer :final_points_2

      t.timestamps null: false
    end
  end
end
