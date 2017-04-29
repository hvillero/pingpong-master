class LeaderboardController < ApplicationController

  def index
    @players = User.board
  end
end
