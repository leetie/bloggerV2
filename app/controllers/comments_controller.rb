class CommentsController < ApplicationController
  include CommentsHelper
  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    flash.notice = "Comment Posted Successfully!"
    redirect_to article_path(@comment.article)
  end
end
