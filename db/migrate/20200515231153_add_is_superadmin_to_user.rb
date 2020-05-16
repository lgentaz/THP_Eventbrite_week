class AddIsSuperadminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_superadmin, :string
  end
end
