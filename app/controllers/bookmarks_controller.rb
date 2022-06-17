class BookmarksController < ApplicationController
  def index
    if params[:tag].present?
      @bookmarks = policy_scope(Bookmark).tagged_with(params[:tag]).includes(:album).to_json
      @tag = params[:tag]
    else
      @bookmarks = policy_scope(Bookmark).includes(:album).to_json
    end
  end
end
