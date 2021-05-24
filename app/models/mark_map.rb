class MarkMap < ApplicationRecord
  belongs_to :blog
  belongs_to :mark

  validates :blog_id, presence: true
  validates :mark_id, presence: true
end
