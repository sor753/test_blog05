module ApplicationHelper
  def document_title
    if @title.present?
      "#{@title} | blog"
    else
      "Blog"
    end
  end
end
