module ApplicationHelper

  def set_title(page_title)
  	base_title = "StayTraders"
  	if page_title.empty?
  		base_title
  	else 
  		page_title
  	end
  end

end
