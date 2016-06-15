class StaticsController < ApplicationController
  def home
    render layout: "home_layout"
  end

  def show_all
    
    @playlists = Playlist.all
    render layout: "not_form_layout"
  end

end
