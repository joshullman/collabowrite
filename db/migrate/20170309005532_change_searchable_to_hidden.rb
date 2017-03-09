class ChangeSearchableToHidden < ActiveRecord::Migration[5.0]
  def change
  	rename_column :groups, :is_searchable, :hidden
  end
end
