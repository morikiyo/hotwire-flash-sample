class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash.notice = 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash.notice = 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash.notice = 'Article was successfully destroyed.'
  end

  private

    def set_article
      @article = Article.find(params[:id]) if params[:id] != 'blank'
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
