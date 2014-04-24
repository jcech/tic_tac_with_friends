class UsersController < ApplicationController

  def show
    @game = Game.new
    @user = User.find(params[:id])

  end
end
