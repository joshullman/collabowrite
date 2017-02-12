class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :scripts
  belongs_to :user_groups
  has_many :groups, through: :user_groups

  has_attached_file :avatar, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
