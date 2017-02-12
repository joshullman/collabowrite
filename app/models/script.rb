class Script < ApplicationRecord

	belongs_to :user
	has_many   :group_scripts
	has_many   :groups, through: :group_scripts

	has_attached_file :pdf
  
  validates_attachment_content_type :pdf, :content_type => "application/pdf"
end
