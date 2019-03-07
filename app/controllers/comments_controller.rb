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
    respond_to do |format|
      if @comment.save
      	#binding.pry
      	p @comment
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
      	
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    article_id = @comment.article.id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_url(article_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end

end
