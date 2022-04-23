class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy] # :edit, :update, :destroy]

  def index
    @lists = List.all
    @list = List.new #form box for creating the list
  end

  def show
    #@list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    #@list = List.new(list_params).save #gets an error but saves to lists
    # @movie = Movie.find(params[:movie_id])
    # @list.movie = @movie

    @list.save
    redirect_to @list
    # if @list.save
    #   redirect_to @movie
    # else
    #   render ''

    # redirect_to list_path(@list)
  end

  # def edit
  #   @list = List.find(params[:id])
  # end

  # def update
  #   @list = List.find(params[:id])
  #   @list.update(list_params)

  #   redirect_to list_path(@list)
  # end

  def destroy
    # @list = List.find(params[:id]) #Used set_list
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end


end
