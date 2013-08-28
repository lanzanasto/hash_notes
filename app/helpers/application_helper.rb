module ApplicationHelper

  def get_hash_tags
    @hash_tags = []
    if current_user
      @hash_tags = current_user.hash_tags.map(&:tag)
    end
    @hash_tags
  end

  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

end
