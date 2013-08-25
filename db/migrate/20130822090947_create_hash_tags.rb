class CreateHashTags < ActiveRecord::Migration
  def change
    create_table :hash_tags do |t|
      t.string :tag
      t.references :user

      t.timestamps
    end
    add_index :hash_tags, :user_id
  end
end
