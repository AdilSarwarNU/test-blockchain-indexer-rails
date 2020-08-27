class Api::V1::CommentsController < Api::V1::BaseController

  def create
    @comment = @current_user.comments.create(comment_params)
    if @comment.save
      render json: {message: 'comment has posted', result: @comment}
    end
  end

  private

  def comment_params
    params.require(:comment).permit( :body, :transaction_id)
  end
end
