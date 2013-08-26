module NotesHelper
  # Extract #tags from the content.
  # Examples:
  #   - #tag
  #   - #tag_tag
  def extract_tags content
    tags = Note.extract_tags content
    tags.join(', ')
  end
end
