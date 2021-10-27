class PlayersController < ApplicationController
  before_action :find, only: :show

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to player_path(@player)
    else
      render :new
    end
  end

  def show
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :position, :price)
  end

  def find
    @player = Player.find(params[:id])
  end
end
