class ChangeHiddenDefaultToFalse < ActiveRecord::Migration[5.0]
  def up
  	change_column_default :groups, :hidden, false
  end

  def down
  	change_column_default :groups, :hidden, true
  end
end
