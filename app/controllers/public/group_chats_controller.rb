class Public::GroupChatsController < ApplicationController
  before_action :authenticate_member!
  before_action :check_group_owner
  def create
    group = Group.find(params[:group_id])
    chat = current_member.group_chats.new(group_chat_params)
    chat.group_id = group.id
    chat.save
    redirect_to request.referer
  end

  def destroy
    GroupChat.find_by(id: params[:id],group_id: params[:group_id]).destroy
    redirect_to request.referer
  end

  def show
    @group = Group.find(params[:id])
    @group_chat = GroupChat.new
    @group_chats = @group.group_chats.page(params[:page]).per(10).reverse_order
  end

  private

  def group_chat_params
    params.require(:group_chat).permit(:chat)
  end

  def check_group_owner
    @group = Group.find(params[:id])
    unless @group.owner_id == current_member.id || @group.includesMember?(current_member)
      redirect_to groups_path
    end
  end

end
