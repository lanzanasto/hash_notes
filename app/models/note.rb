class Note < ActiveRecord::Base

  belongs_to :user
  attr_accessible :content, :user

  def self.extract_tags content
    content.scan(/#\w*/)
  end

end
