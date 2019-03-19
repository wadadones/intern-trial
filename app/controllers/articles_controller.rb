class ArticlesController < ApplicationController
  helper_method :article
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: t('flash.create_success', obj: Article.model_name.human)
    else
      flash.now[:error] = t('flash.create_failed', obj: Article.model_name.human)
      render :new
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if article.update(article_params)
      redirect_to article, notice: t('flash.update_success', obj: Article.model_name.human)
    else
      flash.now[:error] = t('flash.update_failed', obj: Article.model_name.human)
      render :edit
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if article.destroy
      redirect_to articles_url, notice: t('flash.destroy_success', obj: Article.model_name.human)
    else
      redirect_to articles_url, notice: t('flash.destroy_failed', obj: Article.model_name.human)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def article
      @article ||= Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
