class AddTotalPointsToUser < ActiveRecord::Migration
  def change
    add_column :users, :total_points, :float, default: 0.0
  end
end
