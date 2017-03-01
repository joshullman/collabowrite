class GroupScriptsController < ApplicationController

  def new
    p params
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
    @group = Group.find(params[:group])
    params[:scripts].each do |script|
      @group_script = GroupScript.create(script_id: script, group_id: params[:group])
    end
    format.html { redirect_to @group, notice: 'Script(s) successfully added to Group' }
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
