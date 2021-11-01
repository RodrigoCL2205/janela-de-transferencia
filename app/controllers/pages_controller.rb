class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @players = Player.all.order("price DESC LIMIT 5")
  end
end
