class AddPublicCommentsToScripts < ActiveRecord::Migration[5.0]
  def change
  	add_column :scripts, :public_comments, :boolean, default: false
  end
end
