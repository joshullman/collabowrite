class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
    if @user == current_user
      @scripts = @user.scripts.order(:created_at => :desc)
    else
      @scripts = @user.scripts.where(is_private: false).order(:created_at => :desc)
    end
    @groups = @user.accepted_groups.sort_by {|group| group.title }
  end

  def profile
  	redirect_to user_path(current_user)
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :avatar)
  end
end
