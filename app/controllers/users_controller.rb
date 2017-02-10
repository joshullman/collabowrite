class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
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
