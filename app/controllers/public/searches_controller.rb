class Public::SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Member"
      @members = Member.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "Post"
      @posts = Post.looks(params[:search], params[:word]).page(params[:page]).per(10).reverse_order
    else
      @groups = Group.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end
end
