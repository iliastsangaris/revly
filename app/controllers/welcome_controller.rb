class WelcomeController < ApplicationController

  def index
    if logged_in?
      redirect_to feed_path
    else
      render(:index)
    end
  end

  def feed
    unless logged_in?
      redirect_to root_path
    else
      @tiles = Tile.order("created_at DESC")
      @client = Soundcloud.new(client_id: SOUNDCLOUD_CLIENT_ID)
    end
  end

end
