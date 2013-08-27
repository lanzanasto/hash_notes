class AddDeltaToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :delta, :boolean, :default => true, :null => false
  end
end
