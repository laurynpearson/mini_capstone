class AddAdminNew < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
