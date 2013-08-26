class Note < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :user

  def self.extract_tags content
    content.scan(/#\w*/)
  end

  # def self.search(search, user_id)
  #   notes = find_with_ferret(search)
  #   notes = find_all_by_user_id(user_id)

  #   if search
  #     notes.find_with_ferret(search)
  #   else
  #     notes
  #   end
  # end

end
