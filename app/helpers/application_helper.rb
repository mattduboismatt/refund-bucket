module ApplicationHelper
  def content_id
    "#{controller_name.underscore}_#{action_name}"
  end
end
