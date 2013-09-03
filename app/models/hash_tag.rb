class HashTag < ActiveRecord::Base
  belongs_to :user

  has_many :note_hashes
  has_many :notes, through: :note_hashes

  attr_accessible :tag, :user, :color
end
