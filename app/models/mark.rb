class Mark < ApplicationRecord
  has_many :mark_maps, dependent: :destroy, foreign_key: 'mark_id'
  has_many :blogs, through: :mark_maps

  def self.tag_search(keyword)
    where(["mark_name like?", "%#{keyword}%"])
  end
end
