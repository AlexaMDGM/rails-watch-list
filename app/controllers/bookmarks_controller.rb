class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: :destroy
  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show
  #   @bookmark = Bookmark.find(params[:id])
  # end

  def new
    # set_list @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create #code to find the list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  # def edit
  #   @bookmark = Bookmark.find(params[:id])
  # end

  # def update
  #   @bookmark = Bookmark.find(params[:id])
  #   @bookmark.update(bookmark_params)

  #   redirect_to bookmark_path(@bookmark)
  # end

  def destroy
    #set_bookmark @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path (@bookmark.list)#comedy page/
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
