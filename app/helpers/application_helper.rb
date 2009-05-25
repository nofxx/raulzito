# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def display_flashes
    flashes = ''
    unless flash.size == 0
      flash.each_pair  do |key, value|
        flashes += content_tag(:div, content_tag(:span, value), :class => 'flashes '+key.to_s)
      end
    end
    flashes
  end

end
