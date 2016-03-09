class AddUserToRegisteredApps < ActiveRecord::Migration
  def change
    add_column :registered_apps, :user_id, :integer
    add_index :registered_apps, :user_id
  end
end
