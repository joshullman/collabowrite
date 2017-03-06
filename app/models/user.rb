class User < ApplicationRecord
  attr_reader :avatar_remote_url


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
      p group_user
      groups << group_user.group
    end
    groups
  end

  def sent_notes
    Note.where(user_id: self.id)
  end

  def avatar_remote_url=(url_value)
    p "I'm in the avatar method"
    p url_value
    self.avatar = URI.parse(url_value)
    self.save
    # Assuming url_value is http://example.com/photos/face.png
    p self
  end

  def self.from_omniauth(auth)
    p "I get here fine"
    p auth
     where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.photo_url = auth.info.image
      user.save!
      user.avatar_remote_url = (auth.info.image)
      user.save!
      # p user
      # user.avatar_remote_url = ("https://graph.facebook.com/#{auth.uid}?fields=picture.type(large)")
      # user.save!
      # p user
    end

  end

end
