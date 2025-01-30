class Public::GroupsController < ApplicationController
  before_action :authenticate_member!
  before_action :check_group_owner, only: [:edit, :update, :permits]

  def index
    @groups = Group.all.page(params[:page]).per(10).reverse_order
    @member = Member.find(current_member.id)
  end

  def show
    @group = Group.find(params[:id])
    @member = current_member
    @permit = Permit.where(group_id: @group.id, member_id: @member.id).first
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

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def permits
    @group = Group.find(params[:id])
    @permits = @group.permits.page(params[:page]).per(10)
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def check_group_owner
    @group = Group.find(params[:id])
    unless @group.owner_id == current_member.id
      redirect_to groups_path
    end
  end

end
