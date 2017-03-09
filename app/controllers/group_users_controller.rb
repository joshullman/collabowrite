class GroupUsersController < ApplicationController

  def new
    @user = params[:user_id]
  end

  # POST /group_users
  # POST /group_users.json
  def create
    @group = Group.find(params[:group])
    if params[:create_mod] == "false"
      @group_user = GroupUser.new(user_id: params[:id], group_id: params[:group], accepted: true, is_mod: true)
    else
      params[:accepted] == "true" ? accepted = true : accepted = false
      @group_user = GroupUser.new(user_id: params[:id], group_id: params[:group], accepted: accepted)
    end
    respond_to do |format|
      if @group_user.save && params[:accepted] == "true"
        format.html { redirect_to @group, notice: 'Successfully joined group' }
        format.json { render :show, status: :created, location: @group_user }
      elsif @group_user.save && params[:accepted] == "false"
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
    @group = Group.find(params[:id])
    @group_user = GroupUser.where(user_id: params[:user], group_id: params[:id]).first
    p params
    if params[:create_mod] == "true"
      @group_user.mod = true
      @group_user.accepted = true
    elsif params[:create_mod] == "false"
      @group_user.mod = false
    elsif params[:accepted] == "true"
      @group_user.accepted = true
    end
    respond_to do |format|
      if @group_user.save
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
    @group = Group.find(params[:id])
    group_user = GroupUser.where(user_id: params[:user], group_id: params[:id]).first
    group_user.destroy
    if @group.users.empty?
      @group.comments.each do |comment|
        comment.destroy
      end
      @group.group_scripts.each do |script|
        script.destroy
      end
      @group.destroy
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Group destroyed' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @group, notice: 'Successfully left group.' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_user_params
      params.fetch(:group_user, {})
    end
end
