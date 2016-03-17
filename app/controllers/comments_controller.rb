class CommentsController < ApplicationController
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

  private

  def comment_params
    {
      beer_id: params.fetch(:beer_id),
      user_id: current_user.id,
      content: params.fetch(:comment).fetch(:content)
    }
  end
end
