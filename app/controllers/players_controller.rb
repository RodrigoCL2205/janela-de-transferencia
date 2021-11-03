class PlayersController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @players = Player.search_by_name_and_position_order_by_price(params[:query])
    else
      @players = Player.all.order('price DESC')
    end
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

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to player_path(@player)
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :age, :position, :price, :photo)
  end

  def find
    @player = Player.find(params[:id])
  end
end
