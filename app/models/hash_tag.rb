class HashTag < ActiveRecord::Base
  belongs_to :user
  attr_accessible :tag, :count, :user
end
