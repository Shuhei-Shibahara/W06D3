class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :liker, null: false, foreign_key: {to_table: :users}
      t.references :likable, null: false, polymorphic: true

      t.timestamps
    end
    add_index  :likes, [:liker_id, :likable_id], unique: true
  end 
end
