class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def show
  	
  end

  def edit
  	
  end

	def create
    @comment = Comment.new(comment_params)
    if @comment.save
      #binding.pry
      redirect_to @comment.article, notice: 'Comment was successfully created.'
    else
      flash.now[:error] = 'Comment cannot be created.'
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.article, notice: 'Comment was successfully updated.'
    else
      flash.now[:error] = 'Comment cannot be updated.'

      render :edit
    end
  end

  def destroy
    article_id = @comment.article.id
    @comment.destroy
    redirect_to article_url(article_id), notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment ||= Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end

end
