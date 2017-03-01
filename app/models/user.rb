class User < ApplicationRecord
  attr_reader :avatar_remote_url
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many   :scripts
  has_many   :group_users
  has_many   :groups, through: :group_users
  has_many   :comments

  has_attached_file :avatar, :default_url => "default_user_icon.svg"
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def accepted_member?(group)
    GroupUser.where(user_id: self.id, group_id: group.id).first.accepted
  end

  def accepted_groups
    groups = []
    group_users = GroupUser.where(user_id: self.id, accepted: true)
    group_users.each do |group_user|
      groups << group_user.group
    end
    groups
  end

  def sent_notes
    Note.where(user_id: self.id)
  end

  def avatar_remote_url=(url_value)
    self.avatar = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @avatar_remote_url = url_value
  end
end
