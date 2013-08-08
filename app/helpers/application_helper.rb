module ApplicationHelper

  def set_title(page_title)
  	base_title = "StayTraders"
  	if page_title.empty?
  		base_title
  	else 
  		page_title + "- StayTraders"
  	end
  end

  def set_meta_tags(meta_tags)
    base_meta = "working holiday, work and travel, travel for free, gap year"
    if meta_tags.empty?
      base_meta
    else
      meta_tags + base_meta
    end
  end

  def current_user?(user)
  	current_user == user
  end

  def truncate_text
    
  end

end
