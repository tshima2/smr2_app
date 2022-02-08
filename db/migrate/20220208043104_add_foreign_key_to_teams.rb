class AddForeignKeyToTeams < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :teams, :users, column: :owner_id
  end
end
