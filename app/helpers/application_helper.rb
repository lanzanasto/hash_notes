module ApplicationHelper

  def get_hash_tags
    @hash_tags = []
    if current_user
      @hash_tags = current_user.hash_tags.map(&:tag)
    end
    @hash_tags
  end

end
