module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-success"
    when :success then "alert alert-info"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
end
