class MakeMovesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @current_player_symbol = @game.active_player.symbol
    @space = @game.board.spaces.find_by(:number => params[:space_number])
    @space.mark_by(@game.active_player)

    if @game.win?
      flash[:notice] = "You Win"
    end
    @game.change_turns
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
