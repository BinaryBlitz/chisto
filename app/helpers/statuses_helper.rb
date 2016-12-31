module StatusesHelper
  def tag_for_status(status)
    content_tag(:span, class: ['tag', status_tag_class_for_status(status)]) do
      Order.human_attribute_name("status.#{status.state}")
    end
  end

  def status_tag_class_for_status(status)
    case status.state
    when 'processing' then 'tag-default'
    when 'confirmed' then 'tag-primary'
    when 'cleaning' then 'tag-info'
    when 'dispatched' then 'tag-warning'
    when 'completed' then 'tag-success'
    when 'canceled' then 'tag-danger'
    end
  end
end
