class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.article = @article
    if @comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
