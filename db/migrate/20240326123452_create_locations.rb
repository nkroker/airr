class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
