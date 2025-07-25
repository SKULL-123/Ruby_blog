class CommentsController < ApplicationController
  def create
    @post = Post.find_by!(slug: params[:post_slug]) 
    @comment = current_user.comments.new(comment_params.merge(post_id: @post.id))

    if @comment.save
      redirect_to post_path(@post), notice: "Комментарий добавлен."
    else
      redirect_to post_path(@post), alert: @comment.errors.full_messages.to_sentence
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
