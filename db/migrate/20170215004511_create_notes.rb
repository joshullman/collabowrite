class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer  :user_id
      t.integer  :script_id
      t.integer  :page_num
      t.text     :content

      t.timestamps
    end
  end
end
