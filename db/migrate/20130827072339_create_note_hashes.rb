class CreateNoteHashes < ActiveRecord::Migration
  def change
    create_table :note_hashes do |t|
      t.references :note
      t.references :hash_tag

      t.timestamps
    end
  end
end
