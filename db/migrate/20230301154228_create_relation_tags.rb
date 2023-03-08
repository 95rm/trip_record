class CreateRelationTags < ActiveRecord::Migration[6.1]
  def change
    create_table :relation_tags do |t|

      t.integer :trip_plan_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
    #同じタグを２回保存するのは出来ないようにしている
    add_index :relation_tags, [:trip_plan_id, :tag_id], unique: true
  end
end
