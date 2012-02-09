module ApplicationHelper
  def flash_messages
    return '' if flash.blank?
    flash_info = flash.keys.collect {|key|
      content_tag(:div,
                  ['<a href="#" class="close" onclick="$(this).parent().fadeOut();"><span>close</span></a>',
                   flash[key],
                   ].join(' ').html_safe,
                  :class => "#{key} message") if flash[key]
    }.join.html_safe
    content_tag(:div, flash_info, id: 'flash').html_safe
  end
end
