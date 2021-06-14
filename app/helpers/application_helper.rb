module ApplicationHelper
  def disable_link_to_current_page(link_path)
    current_page?(link_path) ? '' : link_path.to_s
  end

  def add_active_class(link_path)
    current_page?(link_path) ? 'd-none' : ''
  end
end
