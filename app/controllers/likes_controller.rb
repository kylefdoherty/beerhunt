class LikesController < ApplicationController
  before_action :logged_in?, only: [:create]

  def create
    @like = Like.new(user_id: current_user.id, beer_id: params[:beer_id])
    @beer = Beer.find(params[:beer_id])

    respond_to do |format|
      if @like.save!
        format.js { render partial: "beers/like_beer.js", beer: @beer }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = Like.find_by(user_id: params[:user_id], beer_id: params[:beer_id])
    @beer = Beer.find(params[:beer_id])

    respond_to do |format|
      if @like.destroy!
        format.js { render partial: "beers/unlike_beer.js", beer: @beer }
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end
end
