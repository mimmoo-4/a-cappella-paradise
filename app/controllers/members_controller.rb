class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
  end

  def destroy
    member = Member.find_by(id: params[:id])
    member.destroy
    redirect_to root_path
  end

end
