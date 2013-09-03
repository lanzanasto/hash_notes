class AddColorToHashTag < ActiveRecord::Migration
  def change
    add_column :hash_tags, :color, :string
  end
end
