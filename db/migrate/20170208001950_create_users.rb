class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string    :email,              null: false, default: ""
      t.string    :encrypted_password, null: false, default: ""
      t.string    :username
      t.string    :oauth_token
      t.datetime  :oauth_expires_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :username,             unique: true
  end
end
