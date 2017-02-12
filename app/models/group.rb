class Group < ApplicationRecord
	has_many   :user_groups
	has_many   :users, through: :user_groups
  has_many   :group_scripts
  has_many   :scripts, through: :group_scripts

	has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def mods
  	u_groups = UserGroup.where(group_id: self.id, mod: true)
  	users = []
  	u_groups.each do |u_group|
  		users << User.find(u_group.user_id)
  	end
  end
  
end
