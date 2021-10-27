class DealsController < ApplicationController
  before_action :set_user, only: [:create, :update]

  def index
    @deals = Deal.all
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit; end

  def update
    @deal.update(deal_params)
    if @deal.save
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @deal.destroy
  end

  private

  def set_user
    @user = current_user
  end

  def deal_params
    params.require(:deal).permit(:completed, :player_id, :user_id)
  end
end
