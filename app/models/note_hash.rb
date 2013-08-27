class NoteHash < ActiveRecord::Base
  attr_accessible :hash_tag, :note

  belongs_to :note
  belongs_to :hash_tag
end
