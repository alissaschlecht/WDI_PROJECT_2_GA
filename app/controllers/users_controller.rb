class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists
    @owned_playlists = @user.owned
    render layout: "not_form_layout"
  end
end
