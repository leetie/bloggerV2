class CommentsController < ApplicationController
  include CommentsHelper
  before_action :require_login #except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.author_name = current_user.username
    @comment.save
    flash.notice = "Comment Posted Successfully!"
    redirect_to article_path(@comment.article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find("#{@comment.article_id}")
    flash.notice = "Comment Deleted Successfully!"
    @comment.destroy
    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @article = Article.find("#{@comment.article_id}")
    @comment.update(comment_params)
    flash.notice = "Comment Updated!"
    redirect_to article_path(@article)
  end
end
