class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :title, null:false
      t.geometry :geom, null:false
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
