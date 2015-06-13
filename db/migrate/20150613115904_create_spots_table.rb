class CreateSpotsTable < ActiveRecord::Migration
  def change
      create_table :spots do |t|
      t.string :name
      t.string :script

      t.timestamps
    end
  end
end
