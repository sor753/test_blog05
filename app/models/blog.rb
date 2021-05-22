class Blog < ApplicationRecord
  has_rich_text :content
  has_one_attached :thumb
end
