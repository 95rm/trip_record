class CreateTripPlanDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_plan_details do |t|

      t.integer :trip_plan_id, null: false
      t.time :hour, null: false
      t.string :category, null: false
      t.integer :what_day, null: false
      t.string :destination, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
