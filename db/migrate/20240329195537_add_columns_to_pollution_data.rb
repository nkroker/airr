class AddColumnsToPollutionData < ActiveRecord::Migration[7.1]
  def change
    change_table :pollution_data do |t|
      t.float :no
      t.float :o3
      t.float :nh3
      t.datetime :recorded_at
    end
  end
end
