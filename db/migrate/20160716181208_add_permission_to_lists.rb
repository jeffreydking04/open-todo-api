class AddPermissionToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :permission, :string
  end
end
