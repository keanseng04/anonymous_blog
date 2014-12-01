class Post <ActiveRecord::Base
  has_many :posts_tags
  has_many :tags, :through => :posts_tags

  validates :title, :presence => true
  validates :content, :presence => true
end