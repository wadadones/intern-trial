class CommentsController < ApplicationController
  helper_method :comment
  def new
    @comment = Comment.new
  end

  def show
  	comment
  end

  def edit
  	comment
  end

  def create
    @comment = Comment.new(comment_params)
    if comment.save
      redirect_to @comment.article, notice: t('flash.create_success', obj: Comment.model_name.human)
    else
      flash.now[:error] = t('flash.create_failed', obj: Comment.model_name.human)
      render :new
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to @comment.article, notice: t('flash.update_success', obj: Comment.model_name.human)
    else
      flash.now[:error] = t('flash.update_failed', obj: Comment.model_name.human)

      render :edit
    end
  end

  def destroy
    article_id = comment.article.id
    comment.destroy
    redirect_to article_url(article_id), notice: t('flash.destroy_success', obj: Comment.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def comment
      @comment ||= Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end

end
