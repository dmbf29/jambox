class ListsController < ApplicationController
  def index
    @bookmarks = policy_scope(Bookmark).includes(:album).to_json
  end
end
