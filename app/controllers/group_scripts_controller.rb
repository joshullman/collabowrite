class GroupScriptsController < ApplicationController

  def edit
  
  end

  # POST /group_scripts
  # POST /group_scripts.json
  def create
    @group_script = GroupScript.new(group_script_params)

    respond_to do |format|
      if @group_script.save
        format.html { redirect_to @group_script, notice: 'Group script was successfully created.' }
        format.json { render :show, status: :created, location: @group_script }
      else
        format.html { render :new }
        format.json { render json: @group_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_scripts/1
  # DELETE /group_scripts/1.json
  def destroy
    @group_script.destroy
    respond_to do |format|
      format.html { redirect_to group_scripts_url, notice: 'Group script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_script_params
      params.fetch(:group_script, {})
    end
end
