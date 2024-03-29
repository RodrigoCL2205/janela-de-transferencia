class DealsController < ApplicationController
  before_action :cart, only: [:sale]
  before_action :set_player, only: [:create]

  def index
    @deals = Deal.all
  end

  def show; end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new
    @deal.player = @player
    @deal.user = current_user
    if @deal.save
      redirect_to players_path, notice: "Jogador adicionado ao carrinho."
    end
  end

  def edit; end

  def sale
    @deals.each { |deal| deal.update(completed: true) }
    redirect_to root_path, notice: "Compra realizada com sucesso."
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to cart_path
  end

  def cart
    @deals = Deal.where(user_id: current_user, completed: false)
  end

  private

  def set_player
    @player = Player.find(params[:player_id])
  end

  def deal_params
    params.require(:deal).permit(:completed)
  end
end
