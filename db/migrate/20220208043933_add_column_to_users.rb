class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :keep_team_id, :integer, null: false, default: 1
  end
end
