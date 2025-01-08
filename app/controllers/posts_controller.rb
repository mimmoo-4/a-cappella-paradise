class PostsController < ApplicationController
    def new
    @post = Post.new
    end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @genre = Genre.find(@post.genre_id)
    @member = Member.find(@post.member_id)
  end

  def edit
    @post = Post.find(params[:id])
    is_matching_login_member
  end

  def update
    @post = Post.find(params[:id])
    is_matching_login_member
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to member_path(current_member.id)
  end

private

  def post_params
    params.require(:post).permit(:post_title, :post_text, :member_id, :genre_id).merge(member_id: current_member.id)
  end

  def is_matching_login_member
    member = Member.find(@post.member_id)
    unless member.id == current_member.id
      redirect_to posts_path
    end
  end

end
