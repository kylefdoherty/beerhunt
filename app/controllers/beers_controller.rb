class BeersController < ApplicationController
  def index
    @beer = Beer.new
    @beers = Beer.all
  end

  def new

  end

  def edit
    @beer = Beer.find(params[:id])

    respond_to do |format|
      format.js { render partial: "beers/edit_beer.js", beer: @beer }
      format.json { render partial: "beers/edit_beer.js", beer: @beer }
    end
  end

  def update
    @beer = Beer.find(params[:id])

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
    @beer = Beer.find(params[:id])
    @beer.destroy!

    redirect_to action: "index"
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :description)
  end
end
