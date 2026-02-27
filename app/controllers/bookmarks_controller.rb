class BookmarksController < ApplicationController
  def new 
    @lists = List.all
    @bookmark = Bookmark.new(movie_id: params[:movie_id])
  end

  def create
    # session[:movies_ids] = params[:movies_ids]
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private 

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
