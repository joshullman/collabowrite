class UsersController < ApplicationController
  require 'will_paginate/array'
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
    if @user == current_user
      @scripts = @user.scripts.order(:created_at => :desc)
    else
      @scripts = []
      @scripts << @user.scripts.where(is_private: false).order(:created_at => :desc)
      @user.scripts.where(is_private: true).each {|script| @scripts << script if script.authorized_viewer?(current_user)}
      @scripts.flatten!.uniq!
    end
    p @user.accepted_groups
    @groups = @user.accepted_groups.sort_by {|group| group.title}.paginate(:page => params[:page])
  end

  def login
  	if current_user
      redirect_to user_path(current_user)
    end
  end

  def failure

  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:username, :email)
  end
end
