class Admin::MembersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

end
