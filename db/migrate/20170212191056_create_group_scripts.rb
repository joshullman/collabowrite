class CreateGroupScripts < ActiveRecord::Migration[5.0]
  def change
    create_table :group_scripts do |t|
      t.integer  :group_id
      t.integer  :script_id

      t.timestamps
    end
    add_index :group_scripts, [:group_id, :script_id], unique: true, name: "by_group_and_script"

  end
end
