class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def subscribe
      playlist = Playlist.find(params[:id])
      current_user.playlists.push(playlist)
      redirect_to "/playlists"
  end

  def unsubscribe
      playlist = Playlist.find(params[:id])
      current_user.playlists.destroy(playlist)
      redirect_to "/playlists"
  end

  def remove

    playlist = Playlist.find(params[:id])
    current_user.playlists.destroy(playlist)
    redirect_to "/users/#{current_user.id}"

  end

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
    
    @list_id = Playlist.ids
    @randlist = @list_id.sample

    # id = @playlists.each do |playlist|
    #   playlist.id
    # end
    # @randlist = @playlist.sample
    # puts @randlist

    render layout: "not_form_layout"
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    playlist = Playlist.find(params[:id])
    @videos = playlist.videos
    render layout: "not_form_layout"
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
    playlist = Playlist.find(params[:id])
    @videos = playlist.videos
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.owner = current_user

    respond_to do |format|
      if @playlist.save
        id = @playlist.id.to_s
        format.html { redirect_to '/playlist/'+id+'/videos/new' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update

    # @playlist = Playlist.find(params[:id])
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to "/users/#{current_user.id}", notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:title, :genre, :length)
    end
end
