module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def get_tag_width(tags)
    tag_counts = tags.map {|tag| tag.count}
    max_value = tag_counts.max
    count_values = tags.map {|tag| {'width' => tag.count/max_value.to_f*100, 'name' => tag.name, 'count' => tag.count}}    
    
    return count_values
  end
  
end

