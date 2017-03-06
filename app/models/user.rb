class User < ApplicationRecord
  attr_reader :avatar_remote_url
  validates :username, uniqueness: { message: "Username taken." }, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

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
    self.avatar = URI.parse(url_value)
    # Assuming url_value is http://example.com/photos/face.png
    # avatar_file_name == "face.png"
    # avatar_content_type == "image/png"
    @avatar_remote_url = url_value
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name   # assuming the user model has a name
      user.avatar_remote_url=("http://graph.facebook.com/#{user.uid}/picture?type=large") # assuming the user model has an image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
