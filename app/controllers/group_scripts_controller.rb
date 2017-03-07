class GroupScriptsController < ApplicationController

  def new
    if params[:script_id]
      @script = Script.find(params[:script_id])
      @groups = current_user.accepted_groups
    else
      @group = Group.find(params[:group_id])
      @scripts = current_user.scripts
    end
  end

  # POST /group_scripts
  # POST /group_scripts.json
  def create
    if params[:groups]
      @script = Script.find(params[:script_id])
      params[:groups].each do |group_id|
        GroupScript.create(group_id: group_id, script_id: @script.id) if !GroupScript.where(group_id: group_id, script_id: @script.id).first
      end
      respond_to do |format|
        format.html { redirect_to @script, notice: 'Script successfully added to Group(s)' }
      end
    elsif params[:scripts]
      @group = Group.find(params[:group_id])
      params[:scripts].each do |script_id|
        GroupScript.create(group_id: @group.id, script_id: script_id) if !GroupScript.where(group_id: @group.id, script_id: script_id).first
      end
      respond_to do |format|
        format.html { redirect_to @group, notice: 'Script(s) successfully added to Group' }
      end
    else
      redirect_to current_user, notice: "No Group or Script selected!"
    end
  end

  # DELETE /group_scripts/1
  # DELETE /group_scripts/1.json
  def destroy
    @group = Group.find(params[:group])
    GroupScript.where(script_id: params[:script], group_id: params[:group]).first.destroy
    respond_to do |format|
      format.html { redirect_to @group, notice: 'Script successfully removed from Group.' }
      format.json { head :no_content }
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_script_params
      params.fetch(:group_script, {})
    end
end
