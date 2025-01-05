class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @post = Post.new
    @posts = @member.posts
  end

  def edit
  end
end
