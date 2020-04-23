class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect {|tag| tag.name}.join(", ")
  end

  def tag_list=(str)
    tag_names = str.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_existing_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_existing_tags
  end
end
