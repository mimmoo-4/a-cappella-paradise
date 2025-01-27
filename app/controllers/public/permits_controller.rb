class Public::PermitsController < ApplicationController
  before_action :authenticate_member!

  def create#参加の申請を行う
    @group = Group.find(params[:group_id])
    permit = current_member.permits.new(group_id: params[:group_id])
    permit.save
    redirect_to request.referer, notice: "グループへ参加を申請しました。"
  end

  def destroy #申請を取り消す
    @group = Group.find(params[:group_id])
    #if @group.owner_id == current_member.id
      #permit = Permit.find_by(member_id: params[:permit_id], group_id: params[:group_id])
      #permit.destroy
      #redirect_to request.referer, notice: "グループへの参加申請を取り消しました"
    #else
      permit = current_member.permits.find_by(group_id: params[:group_id])
      permit.destroy
      redirect_to request.referer, notice: "グループへの参加申請を取り消しました"
    #end
  end


  private

  def permit_params
    params.permit(group_id)
  end

end
