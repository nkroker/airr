class CreatePollutionData < ActiveRecord::Migration[7.1]
  def change
    create_table :pollution_data do |t|
      t.integer :aqi
      t.float :pm2_5
      t.float :pm10
      t.float :no2
      t.float :co
      t.float :so2
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
