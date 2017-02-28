class CreateScripts < ActiveRecord::Migration[5.0]
  def change
    create_table :scripts do |t|
    	t.string   :title
    	t.text     :logline
    	t.text     :description
    	t.integer  :user_id
    	t.boolean  :is_private


      t.timestamps
    end
  end
end
