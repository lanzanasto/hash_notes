class RemoveCountFromHashTag < ActiveRecord::Migration
  def up
    remove_column :hash_tags, :count
  end

  def down
    add_column :hash_tags, :count, :integer
  end
end
