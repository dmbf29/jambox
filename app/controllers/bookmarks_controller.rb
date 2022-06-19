class BookmarksController < ApplicationController
  def index
    if params[:tag].present?
      @bookmarks = policy_scope(Bookmark).tagged_with(params[:tag]).includes(:album).to_json
      @tag = params[:tag]
    else
      @bookmarks = policy_scope(Bookmark).includes(:album)
      @favs = @bookmarks.order(cached_votes_total: :desc).to_json
      @new_ones = @bookmarks.order(created_at: :desc).to_json
      @throw_backs = @bookmarks.order(cached_votes_total: :asc).to_json
      @recents = @bookmarks.where('cached_votes_total >= ?', 1).order(updated_at: :desc).to_json
      @bookmarks = @bookmarks.to_json
    end
  end

  def new
    @bookmark = Bookmark.new
    @album = Album.new
    @album.build_artist
    authorize @bookmark
  end

end
