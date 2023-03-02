class CreateTripPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_plans do |t|

      t.integer :user_id, null: false
      t.string :title_name, null: false
      t.integer :first_schedule, null: false
      t.integer :second_schedule, null: false
      t.integer :number_day, null: false
      t.integer :budget, null: false
      t.boolean :status, null: false, default: false

      t.timestamps
    end
  end
end
