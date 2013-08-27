ThinkingSphinx::Index.define :note, :with => :active_record, :delta => true do
  # fields
  indexes content

  # attributes
  has user_id, created_at, updated_at
end
