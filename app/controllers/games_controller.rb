class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "Let the games begin"
      redirect_to game_path(@game)
    else
      flash[:notice] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
    @player_x = User.find(@game.player_x)
    @player_o = User.find(@game.player_o)
    @current_player = User.find(@game.current_player.user_id)
  end

  private
  def game_params
    params.require(:game).permit(:player_x, :player_o)
  end

end
