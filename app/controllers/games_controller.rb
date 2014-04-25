class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
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
  end

  private
  def game_params
    params.require(:game).permit(:current_player)
  end

end
