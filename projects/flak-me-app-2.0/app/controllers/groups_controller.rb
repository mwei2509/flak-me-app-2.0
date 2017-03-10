class GroupsController < ApplicationController
  before_action :set_group, only:[:edit, :show, :destroy, :modify]
  before_action :set_groups

  def index
    @group=Group.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    
    if @group.save
      #link to creator and make them admin
      @group.set_admin(current_user)
      flash[:success] = 'Group added!'
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.includes(:messages).find_by(slug: params[:slug])
    @message = Message.new
    @user=User.find(current_user.id)
  end

  def destroy
    if @role=="admin"
      @group.destroy
      respond_to do |format|
        flash[:notice] = {error: ["Your group was deleted"]}
        format.html { redirect_to groups_path }
        format.js { render template: 'groups/group_error.js.erb'}
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["You are not the admin"]}
        format.html { redirect_to group_path(@group) }
        format.js { render template: 'groups/group_error.js.erb'}
      end
    end
  end

  def modify
    #deactivate, add, ban, leave
    other_user=User.find(params[:user_id]) if !params[:user_id].nil?
    modify={
      role: @role,
      user: current_user,
      other_user: other_user,
      action: params[:a]
    }
    @group.modify(modify)
    redirect_to group_path(@group)
  end

  private
  def set_groups
    @groups = Group.where(private: false)
  end

  def set_group
    @group = Group.find_by(slug: params[:slug])
    role=Role.find_by(group_id: @group.id, user_id: current_user.id)
    if role.nil?
      @role=""
    else
      @role=role.role_type
    end
  end

  def group_params
    params.require(:group).permit(:title, :modify, :user_id, :group_img)
  end
end
