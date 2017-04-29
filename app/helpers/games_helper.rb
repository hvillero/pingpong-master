module GamesHelper
  def game_score(game)
    "#{game.final_points_1} - #{game.final_points_2}"
  end

  def winner_or_loser(game, user)
    game.winner == user ? "W" : "L"
  end

  def other_players(user)
    User.where.not(id: user.id).all
  end

  def opponent_name(game, user)
    user == game.player1 ? game.player2.name : game.player1.name
  end
end
