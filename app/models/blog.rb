class Blog < ApplicationRecord
  has_rich_text :content
  has_one_attached :thumb

  has_many :mark_maps, dependent: :destroy
  has_many :marks, through: :mark_maps

  def self.category(keyword)
    where(["image like?", "%#{keyword}%"])
  end

  def save_mark(sent_marks)
    current_marks = self.marks.pluck(:mark_name) unless self.marks.nil?
    old_marks = current_marks - sent_marks
    new_marks = sent_marks - current_marks

    old_marks.each do |old|
      self.marks.delete Mark.find_by(mark_name: old)
    end

    new_marks.each do |new|
      new_blog_mark = Mark.find_or_create_by(mark_name: new)
      self.marks << new_blog_mark
    end
  end
end
