class GamesController < ApplicationController
  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    if @game.save
      redirect_to games_path
    else
      flash[:alert] = @game.errors.full_messages
      render :new
    end
  end

  private

  def games_params
    params.require(:game).permit(:player1_id, :player2_id, :final_points_1, :final_points_2, :gamed_at)
  end
end

