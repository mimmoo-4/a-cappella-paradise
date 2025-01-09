class SearchesController < ApplicationController
  before_action :authenticate_member!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Member"
      @members = Member.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
