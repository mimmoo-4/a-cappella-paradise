class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @post_comments = PostComment.all.page(params[:page]).per(10)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to admin_post_comments_path
  end
end
