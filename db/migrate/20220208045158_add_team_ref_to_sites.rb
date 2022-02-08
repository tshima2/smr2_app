class AddTeamRefToSites < ActiveRecord::Migration[6.0]
  def change
    add_reference :sites, :team, foreign_key: true
  end
end
