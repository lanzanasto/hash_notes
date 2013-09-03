class Note < ActiveRecord::Base

  belongs_to :user

  has_many :note_hashes
  has_many :hash_tags, through: :note_hashes, :uniq => true

  attr_accessible :content, :user

  after_save :save_tags
  before_update :destroy_tags
  after_destroy :destroy_tags

  def save_tags
    tags = extract_tags

    tags.each do |tag|
      ht = HashTag.where(:tag => tag, :user_id => user.id)
      if ht.empty?
        create_tag tag
      else
        self.hash_tags << ht.first
      end
    end
  end

  def destroy_tags
    user_hash_tags = HashTag.where(:user_id => user.id)
    user_hash_tags.each do |tag|
      tag.destroy if tag.notes.empty?
    end
  end

  def create_tag tag
    color = "%06x" % (rand * 0xffffff)
    hash_tag = HashTag.create(:tag => tag, :user => user, :color => color)
    self.hash_tags << hash_tag
  end

  def extract_tags
    content.scan(/#[[:alpha:]_]*/)
  end

  def html_safe_content
    content.gsub(/\n/,"<br/>").html_safe
  end

end
