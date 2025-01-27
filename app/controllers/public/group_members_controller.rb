class Public::GroupMembersController < ApplicationController
  before_action :authenticate_member!

  def create
    @group = Group.find(params[:group_id]) #グループを探す
    @permit = Permit.find(params[:permit_id]) #申請を探す
    @group_member = GroupMember.create(member_id: @permit.member_id, group_id: params[:group_id]) #申請者をグループに入れる
    @permit.destroy #許可したあとに申請を消す
    redirect_to request.referer, notice: "グループへの参加申請を承認しました。"
  end

  def destroy
    group_member = current_member.group_members.find_by(group_id: params[:group_id])
    group_member.destroy
    redirect_to request.referer
  end

  private
    def group_member_params
      params.permit(:group_id, :member_id, :permit_id)
    end
end
