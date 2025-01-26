class Public::GroupsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_correct_member, only: [:edit, :update]

  def index
    @groups = Group.all
    @member = Member.find(current_member.id)
  end

  def show
    @group = Group.find(params[:id])
    @member = Member.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_member.id
    if @group.save
      redirect_to groups_path, method: :post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def ensure_correct_member
    @group = Group.find(params[:id])
    unless @group.owner_id == current_member.id
      redirect_to groups_path
    end
  end

end
