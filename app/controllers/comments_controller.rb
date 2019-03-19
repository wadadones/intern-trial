class CommentsController < ApplicationController
  helper_method :comment, :article
  def new
    @comment = article.comments.build
  end

  def edit
  end

  def create
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.article, notice: t('flash.create_success', obj: Comment.model_name.human)
    else
      flash.now[:error] = t('flash.create_failed', obj: Comment.model_name.human)
      article
      render :new
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to comment.article, notice: t('flash.update_success', obj: Comment.model_name.human)
    else
      flash.now[:error] = t('flash.update_failed', obj: Comment.model_name.human)
      article
      render :edit
    end
  end

  def destroy
    if comment.destroy
      redirect_to article_url(comment.article), notice: t('flash.destroy_success', obj: Comment.model_name.human)
    else
      flash.now[:error] = t('flash.destroy_failed', obj: Comment.model_name.human)
      article
      render "articles/show"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def comment
      @comment ||= Comment.find(params[:id])
    end

    def article
      @article ||= Article.find(params[:article_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end

end
