class GroupUsersController < ApplicationController

  # POST /group_users
  # POST /group_users.json
  def create
    @group = Group.find(params[:group])
    @group_user = GroupUser.new(user_id: params[:user], group_id: params[:group], accepted: params[:accepted])

    respond_to do |format|
      if @group_user.save && params[:accepted] == true
        format.html { redirect_to @group, notice: 'Successfully joined group' }
        format.json { render :show, status: :created, location: @group_user }
      elsif @group_user.save && params[:accepted] == false
        format.html { redirect_to @group, notice: 'Successfully requested to joined group' }
        format.json { render :show, status: :created, location: @group_user }
      else
        format.html { render :new }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_users/1
  # PATCH/PUT /group_users/1.json
  def update
    @group = Group.find(params[:group])
    @group_user = GroupUser.where(user_id: params[:user], group_id: params[:group]).first
    if params[:create_mod]
      if params[:create_mod] == true
        @group_user.mod = true
      else
        @group_user.mod = false
      end
    elsif params[:accepted]
      @group_user.accepted = true
    end
    respond_to do |format|
      if @group_user.update(group_user_params)
        format.html { redirect_to @group, notice: 'Group user was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_user }
      else
        format.html { render :edit }
        format.json { render json: @group_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_users/1
  # DELETE /group_users/1.json
  def destroy
    group = GroupUser.where(user_id: params[:user], group_id: params[:group]).first
    group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Successfully left group.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_user_params
      params.fetch(:group_user, {})
    end
end
