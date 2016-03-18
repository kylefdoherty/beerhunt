class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save!
        @beer = Beer.find(params[:beer_id])
        format.js { render partial: "beers/comments/add_comment.js", beer: @beer }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render partial: "beers/comments/edit_comment.js", comment: @comment }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(content: params.fetch(:comment).fetch(:content))
        format.js { render partial: "beers/comments/update_comment.js", comment: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @beer = Beer.find(@comment.beer_id)

    respond_to do |format|
      if @comment.destroy!
        format.js { render partial: "beers/comments/destroy_comment.js", beer: @beer }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    {
      beer_id: params.fetch(:beer_id),
      user_id: current_user.id,
      content: params.fetch(:comment).fetch(:content)
    }
  end
end
