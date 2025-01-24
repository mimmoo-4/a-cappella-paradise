class Public::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
    member = Member.find(params[:id])
    unless member.id == current_member.id
      redirect_to member_path(current_member.id)
    end
    @member = Member.find(params[:id])
  end

  def update

    member = Member.find(params[:id])
    unless member.id == current_member.id
      redirect_to member_path(current_member.id)
    end

    @member = Member.find(params[:id])
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

  private

  def member_params
    params.require(:member).permit(:name, :email, :nickname, :profile_image, :address, :self_introduction, :main_part)
  end

end