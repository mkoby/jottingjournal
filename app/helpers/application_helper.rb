module ApplicationHelper
  def display_flash(name,msg)
    case name.to_s
    when "notice" then
      content_tag :div, button_tag('x', :type => 'button', :class => "close", "data-dismiss" => "alert") + msg, :class => "alert alert-success fade in"
    when "alert" then
      content_tag :div, button_tag('x', :type => 'button', :class => "close", "data-dismiss" => "alert") +  msg, :class => "alert alert-error"
    else
      content_tag :div, button_tag('x', :type => 'button', :class => "close", "data-dismiss" => "alert") + msg, :class => "alert alert-info fade in"
    end
  end
end
