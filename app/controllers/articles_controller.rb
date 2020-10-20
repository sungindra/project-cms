class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update destroy]
  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result.order(created_at: :asc), items: 25)
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Artikel berhasil dibuat'
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: 'Artikel berhasil diperbaharui'
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Artikel berhasil dihapus'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
