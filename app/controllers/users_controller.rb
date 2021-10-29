class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    @users = User.all.order("id ASC")

  end

  def update
    if @user.manager == true
      @user.update(manager: false)
    else
      @user.update(manager: true)
    end
    redirect_to users_path
  end

  def destroy
    user_params
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    @user = User.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
