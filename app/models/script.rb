class Script < ApplicationRecord

	has_attached_file :pdf, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }
  
  validates_attachment_content_type :pdf, :content_type => "application/pdf"
end
