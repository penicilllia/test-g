module SessionsHelper

  def flash_message
    content_tag :p, flash[:alert], class: 'flash alert'
  end

end
