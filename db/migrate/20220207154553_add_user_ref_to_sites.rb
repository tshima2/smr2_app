class AddUserRefToSites < ActiveRecord::Migration[6.0]
  def change
    add_reference :sites, :user, foreign_key: true
  end
end
