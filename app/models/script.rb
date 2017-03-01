class Script < ApplicationRecord

	belongs_to :user
	has_many   :group_scripts
	has_many   :groups, through: :group_scripts
	has_many   :notes
	has_many   :comments, as: :commentable

	has_attached_file :pdf
  
  validates_attachment_content_type :pdf, :content_type => "application/pdf"

  def authorized_viwer?(user)
  	!(self.user.accepted_groups & user.accepted_groups).empty?
  end
end
