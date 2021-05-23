class Blog < ApplicationRecord
  has_rich_text :content
  has_one_attached :thumb

  def self.category(keyword)
    where(["image like?", "%#{keyword}%"])
  end
end
