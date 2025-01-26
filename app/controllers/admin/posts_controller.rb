class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_dashboards_path, notice: '投稿を削除しました。'
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @genre = Genre.find(@post.genre_id)
    @member = Member.find(@post.member_id)
  end


end
