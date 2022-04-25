module SessionsHelper

  def flash_message
  #  content_tag :p, flash[:alert], class: 'flash alert'
    flash.each do |key, msg|
      content_tag :p, msg, :id => key, :class => 'flash'
      #content_tag :p, flash[:key], class: 'flash'
    end

  end

end
