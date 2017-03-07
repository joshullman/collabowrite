class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.integer  :user_id
      t.integer  :group_id
      t.boolean  :mod, default: false
      t.boolean  :accepted, default: false

      t.timestamps
    end
    add_index :group_users, [:group_id, :user_id], unique: true, name: "by_group_and_user"
  end
end
