class Script < ApplicationRecord
	validates  :title, presence: { message: "Script must have a title!" }
	belongs_to :user
	has_many   :group_scripts
	has_many   :groups, through: :group_scripts
	has_many   :notes
	has_many   :comments, as: :commentable

	has_attached_file :pdf
  
  validates_attachment_content_type :pdf, :content_type => "application/pdf"

  def authorized_viewer?(user)
  	!(self.groups & user.accepted_groups).empty?
  end
end
