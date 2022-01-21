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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
