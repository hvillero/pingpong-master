class Game < ActiveRecord::Base

  attr_accessor :winner, :loser

  belongs_to :player1, class_name: User
  belongs_to :player2, class_name: User

  validates_presence_of :player1_id, :player2_id
  validates_presence_of :gamed_at, message: 'Date is not valid'
  validate :game_score

  after_create :calculate_rankings


  def winner
    final_points_1 > final_points_2 ? player1 : player2
  end

  def loser
    final_points_1 < final_points_2 ? player1 : player2
  end

  private

  def calculate_rankings
    winner_points = winner.total_points
    if loser.new_in_board?
      winner.update!(total_points: winner_points + (diff_score * 0.1))
    else
      diff_ranking= (winner.total_points - loser.total_points).abs
      winner.update!(total_points: winner_points + diff_ranking + diff_score)
    end
  end

  def diff_score
    (final_points_1 - final_points_2).abs
  end

  def game_score
    return errors.add(:base, 'Scores for players is mandatory') unless final_points_1 && final_points_2
    return errors.add(:base, 'They are games to 21, Winner needs at less 21 points') if final_points_1 < 21 && final_points_2 < 21
    if (final_points_1 >= 21 || final_points_2 >= 21) && diff_score != 2
      errors.add(:base, "Each game needs to be won by a two point margin.")
    end
  end
end
