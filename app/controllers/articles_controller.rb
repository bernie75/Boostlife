class ArticlesController < ApplicationController
skip_before_action :authenticate_user!

before_action :set_article, only: [:show, :edit, :update, :destroy]

def index
  @articles = Article.all
end

def show
end
def new
  @article = Article.new
end

def create
    @article = Articles.new(article_params)
    respond_to do |format|
    if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
        else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def edit

  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:article])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
