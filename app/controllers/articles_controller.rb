class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:each, :index, :show]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    #add comment_params helper method
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    # @author = current_user.email
    @article = Article.new(article_params)
    @article.author = current_user.username
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    flash.notice = "Article '#{@article.title}' Deleted!"
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end
end
