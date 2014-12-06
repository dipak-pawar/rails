module ApplicationHelper

  def full_title title = ''
    base_title = 'Ruby on Rails Tutorial Sample App'
    if title.empty?
      full_title = base_title
    else
      full_title "#{title} | #{base_title}"
    end
  end

end
