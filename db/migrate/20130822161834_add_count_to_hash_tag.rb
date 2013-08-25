class AddCountToHashTag < ActiveRecord::Migration
  def change
    add_column :hash_tags, :count, :integer
  end
end
