class ChangeIsPrivateDefaultToTrue < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :scripts, :is_private, true
  end
end
