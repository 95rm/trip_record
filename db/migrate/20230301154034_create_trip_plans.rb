class CreateTripPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_plans do |t|

      t.integer :user_id, null: false
      t.string :tatle_name, null: false
      t.integer :schedule, null: false
      t.integer :number_day, null: false
      t.integer :budget, null: false
      t.integer :hour, null: false
      t.integer :minute, null: false
      t.string :category, null: false
      t.integer :what_day, null: false
      t.string :destination, null: false
      t.integer :price, null: false
      t.integer :status, null: false, default: "0"

      t.timestamps
    end
  end
end
