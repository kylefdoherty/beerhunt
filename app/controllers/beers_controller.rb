class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  def index
    @beer = Beer.new
    @beers = Beer.all
  end

  def show
    @comment = Comment.new
  end

  def new
  end

  def edit
    respond_to do |format|
      format.js { render partial: "beers/edit_beer.js", beer: @beer }
      format.json { render partial: "beers/edit_beer.js", beer: @beer }
    end
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.js { render partial: "beers/update_beer.js", beer: @beer }
      else
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @beer = Beer.new(beer_params)

    respond_to do |format|
      if @beer.save!
        format.html { redirect_to root_path, notice: "Added: #{@beer.name}!" }
      else
        format.html { render :index }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @beer.destroy!

    redirect_to action: "index"
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :description)
  end
end
