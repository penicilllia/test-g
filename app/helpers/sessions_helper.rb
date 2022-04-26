module SessionsHelper

  def flash_message
    flash.each do |key, msg|
      content_tag :p, msg, :id => key, :class => 'flash'
    end

  end

end
