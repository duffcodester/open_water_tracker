module ApplicationHelper
  BASE_TITLE = 'COMSA Tracker'

  def full_title(page_title)
    if page_title.empty?
      BASE_TITLE
    else
      "#{page_title} | #{BASE_TITLE}"
    end
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def boolean_to_words(value)
    value ? 'Yes' : 'No'
  end

  def handle_action(resource, message, page)
    if yield(resource)
      handle_action_true(message, resource)
    else
      render page
    end
  end

  def handle_action_true(message, resource)
    flash[:success] = message
    redirect_to resource
  end

  def phone_number_link(text)
    sets_of_numbers = text.scan(/[0-9]+/)
    number = "+1-#{sets_of_numbers.join('-')}"
    link_to text, "tel:#{number}"
  end
end
