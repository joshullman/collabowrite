class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table   :groups do |t|
      t.string     :title
      t.text       :description
      t.attachment :image
      t.boolean    :is_private, default: true
      t.boolean    :is_searchable, default: true

      t.timestamps
    end
  end
end
