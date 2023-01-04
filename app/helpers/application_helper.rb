module ApplicationHelper
  def content_id
    "#{controller_name.underscore}_#{action_name}"
  end

  def render_flash_stream
    turbo_stream.update "flash", partial: "layouts/flash"
  end
end
