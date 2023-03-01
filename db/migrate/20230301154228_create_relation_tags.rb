class CreateRelationTags < ActiveRecord::Migration[6.1]
  def change
    create_table :relation_tags do |t|
      
      t.integer :trip_plan_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
