class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @post = Post.new
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
    unless @member.id == current_member.id
      redirect_to member_path(current_member.id)
    end
  end

  def update
    @member = Member.find(params[:id])
    unless @member.id == current_member.id
      redirect_to member_path(current_member.id)
    end

    if @member.update(member_params)
      redirect_to member_path(@member.id)
    else
      render :edit
    end
  end

  def destroy
    member = Member.find_by(id: params[:id])
    member.destroy
    redirect_to new_member_registration_path
  end

  def index
    @member = current_member
    @members = Member.all.page(params[:page]).per(10)
  end

  private

  def member_params
    params.require(:member).permit(:name, :email, :nickname, :profile_image, :address, :self_introduction, :main_part)
  end

end