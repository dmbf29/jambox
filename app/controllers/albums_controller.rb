class AlbumsController < ApplicationController
  skip_after_action :verify_authorized, only: [:search]

  def search
    RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    @albums = RSpotify::Album.search(params[:query])
  end

  def create
    @album = Album.find_by(spotify_id: album_params[:spotify_id]) || Album.new(album_params)
    authorize @album
    if @album.save
      @album.upload_photo(params[:album][:photo_url])
      @bookmark = Bookmark.create(user: current_user, album: @album)
      # params[:tags].each do |tag|
      #   @bookmark.tag_list.add(tag) unless tag.blank?
      # end
      @bookmark.tag_list.add(params[:tags]) if params[:tags].present?
      @bookmark.tag_list.add(params[:tag_list], parse: true) if params[:tag_list].present?
      @bookmark.save
      redirect_to bookmarks_path
    else
      render 'bookings/new'
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :spotify_id, :release_date, artist_attributes: [:name])
  end
end
