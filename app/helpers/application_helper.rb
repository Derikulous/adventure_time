module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-success"
    when :success then "alert alert-info"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
  devise_mapping.to
end
end
