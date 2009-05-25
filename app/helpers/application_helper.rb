# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def display_flashes
    flashes = ''
    unless flash.size == 0
      flash.each_pair  do |key, value|
        flashes += content_tag(:div, content_tag(:div, value, :class => 'message '+key.to_s), :class => 'flash')
      end
    end
    flashes
  end

  def simple_table_for(obj, *attr)
    return if obj.empty?
    attr.map!(&:to_s)
    attr = filter_enum(obj, attr)
    out = "<table class='table'><tr>"
    out += attr.map { |a| "<th>#{obj[0].class.human_attribute_name(a.gsub(/_text/, ""))}</th>" }.to_s + "</tr>"
    obj.map { |o| o[attr[0]] = link_to o[attr[0]], o }
    ss = obj.map { |o| attr.map { |a| "<td>#{o[a]}</td>" }}
    out += ss.map { |s| "<tr>#{s}</tr>" }.to_s
    out += "</table>"
  end

  def sidebar(title = "Menu", &block)
    content_for :sidebar do
      concat "<div class='block'><h3>#{title}</h3><ul class='navigation'>"
      yield
      concat '</ul></div>'
    end
  end

  def side_menu_for stuff
    out = "<div class='block'><h3>Menu</h3><ul class='navigation'>"
    stuff.each { |s| s.each { |s| out += "<li>#{link_to s[0], s[1]}</li>"}}
    out += "</ul></div>"
  end

  def image_list_for(stuff, title)
    out = "<div class='block' id='block-lists'><div class='content'><h2 class='title'>#{title}</h2><div class='inner'><ul class='list'>"
    stuff.map do |s|
      out += "<li><div class='left'><a href='#{s[:url]}'><img  src='#{s[:image]}' alt='avatar' /></a></div><div class='item'>"
      out += "<p>#{s[:body]}</p></div></li>"
    end
    out += "</ul></div>"
  end

  def link(name, path, *args)
    return "<li>" + link_to(name, path, *(args)) + "</li>"
  end

end
