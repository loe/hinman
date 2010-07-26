module ApplicationHelper
  
  def page_title(*title)
    content_for(:title) { [title, 'US Team Racing Championship'].flatten.compact.join(' - ') }
  end
  
end
