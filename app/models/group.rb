class Group < ApplicationRecord
	has_many   :group_users
	has_many   :users, through: :group_users
  has_many   :group_scripts
  has_many   :scripts, through: :group_scripts
  has_many   :comments, as: :commentable

	has_attached_file :image, :default_url => "default_group_icon.jpg"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def mods
  	u_groups = GroupUser.where(group_id: self.id, mod: true)
  	users = []
  	u_groups.each do |u_group|
  		users << User.find(u_group.user_id)
  	end
    users
  end

  def members
    members = []
    group_users = self.group_users.where(accepted: true)
    group_users.each do |group_user|
      members << group_user.user
    end
    members
  end

  def pending?(user)
    self.group_users.where(user_id: user.id, accepted: false).first ? true : false
  end
  
end
