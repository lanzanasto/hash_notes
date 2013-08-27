ThinkingSphinx::Index.define :note, :with => :active_record do
  # fields
  indexes content

  # attributes
  has user_id, created_at, updated_at

  set_property :delta => true
end
