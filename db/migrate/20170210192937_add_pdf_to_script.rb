class AddPdfToScript < ActiveRecord::Migration[5.0]
  def up
    add_attachment :scripts, :pdf
  end

  def down
    remove_attachment :scripts, :pdf
  end
end
