module ApplicationHelper
  def display_flash(name,msg)
    case name.to_s
    when "notice" then
      content_tag :div, msg, :class => "alert alert-success"
    when "alert" then
      content_tag :div, msg, :class => "alert alert-error"
    else
      content_tag :div, msg, :class => "alert alert-info"
    end
  end
end
