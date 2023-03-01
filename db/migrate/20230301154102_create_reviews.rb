class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :trip_plan_id, null: false
      t.text :review, null: false

      t.timestamps
    end
  end
end
