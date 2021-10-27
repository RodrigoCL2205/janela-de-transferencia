class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :position, :price)
  end
end
