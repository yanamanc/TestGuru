module SessionsHelper

  def message(key)
    content_tag(:p, flash[key], class: "flash #{key}") if flash[key].present?
  end
  
end
