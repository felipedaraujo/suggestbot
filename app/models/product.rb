class Product < ApplicationRecord
  searchkick

  has_many :taggings
  has_many :tags, through: :taggings

  def tags_list=(names)
    self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
    end
  end

  def tags_list
    self.tags.map(&:name).join(", ")
  end

  def search_data
    { tags: tags_list }
  end
end
