module StatusesHelper
  def badge_for_status(status)
    content_tag(:span, class: ['badge', status_badge_class_for_status(status)]) do
      Order.human_attribute_name("status.#{status.state}")
    end
  end

  def status_badge_class_for_status(status)
    case status.state
    when 'processing' then 'badge-default'
    when 'confirmed' then 'badge-primary'
    when 'cleaning' then 'badge-info'
    when 'dispatched' then 'badge-warning'
    when 'completed' then 'badge-success'
    when 'canceled' then 'badge-danger'
    end
  end
end
