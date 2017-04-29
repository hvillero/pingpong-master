class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  scope :board, -> { order("total_points DESC").all }

  def games
    Game.where('player1_id = :id OR player1_id = :id', id: id)
  end


  def new_in_board?
    total_points == 0.0
  end
end
