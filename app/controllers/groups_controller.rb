class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    # @filterrific = initialize_filterrific(
    #   Group,
    #   params[:filterrific],
    #   select_options: {
    #     sorted_by: Group.options_for_sorted_by
    #     },
    #   persistence_id: 'shared_key',
    #   default_filter_params: {},
    #   available_filters: [],
    # ) or return
    @groups = Group.search(params[:search]).paginate(:page => params[:page]).order('created_at desc')
    # @groups = @filterrific.find.page(params[:page])
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @mods = @group.mods
    @members = @group.members.sort_by {|user| user.username }
    @scripts = @group.scripts.sort_by {|script| script.group_scripts.where(group_id: @group.id).first.created_at}
    @scripts.reverse!
    @comments = @group.comments.order(:created_at => :desc)
    @pending = @group.pending.sort_by {|user| user.username }
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        GroupUser.create(user_id: current_user.id, group_id: @group.id, mod: true, accepted: true)
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    pending = @group.pending
    if group_params[:is_private] == "false" && !pending.empty?
      pending.each do |user|
        gu = GroupUser.find(user_id: user, group_id: @group)
        gu.accepted = true
        gu.save
      end
    end
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    group_users = @group.group_users
    group_scripts = @group.group_scripts
    comments = @group.comments
    group_users.each do |user_relation|
      user_relation.destroy
    end
    group_scripts.each do |script_relation|
      script_relation.destroy
    end
    comments.each do |comment|
      comment.destroy
    end
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:title, :description, :is_private, :image, :hidden)
    end
end
