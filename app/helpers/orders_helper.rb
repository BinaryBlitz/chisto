module OrdersHelper
  def status_badge_for_order(order)
    content_tag(:span, class: ['badge', status_badge_class_for_order(order)]) do
      Order.human_attribute_name("status.#{order.status}")
    end
  end

  def status_badge_class_for_order(order)
    case order.status
    when 'processing' then 'badge-default'
    when 'confirmed' then 'badge-primary'
    when 'cleaning' then 'badge-info'
    when 'dispatched' then 'badge-warning'
    when 'completed' then 'badge-success'
    when 'canceled' then 'badge-danger'
    end
  end
end
