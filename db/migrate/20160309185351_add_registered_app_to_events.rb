class AddRegisteredAppToEvents < ActiveRecord::Migration
  def change
    add_column :events, :registered_app_id, :integer
    add_index :events, :registered_app_id
  end
end
