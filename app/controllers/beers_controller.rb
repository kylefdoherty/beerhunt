class BeersController < ApplicationController
  def index
    @beer = Beer.new
    @beers = Beer.all
  end

  def new

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

  private

  def beer_params
    params.require(:beer).permit(:name, :description)
  end
end
