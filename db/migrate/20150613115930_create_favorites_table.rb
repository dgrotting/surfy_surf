class CreateFavoritesTable < ActiveRecord::Migration
  def change
      create_table :favorites do |t|
      t.integer :spot_id
      t.integer :user_id

      t.timestamps
    end
  end
end
