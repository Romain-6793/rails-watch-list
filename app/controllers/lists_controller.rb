class ListsController < ApplicationController
  def index
    @lists = List.all
    @movies = Movie.all.order(rating: :desc)
    @bookmarks = Bookmark.all
  end

  def show
    @list = List.find(params[:id])
    # @movies = Movie.where(id: session[:movies_ids]).order(rating: :desc)
  end

  def new 
    # @movies = Movie.all
    @list = List.new
  end

  def create
    # session[:movies_ids] = params[:movies_ids]
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private 

  def list_params
    params.require(:list).permit(:name)
  end
end
