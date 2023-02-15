class StaticPagesController < ApplicationController
  def home
    @gossip = Gossip.all
    @user = User.all
  end

  def contact

  end

  def team

  end
end
