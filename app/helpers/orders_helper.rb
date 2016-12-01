module OrdersHelper
  def status_for_order(order)
    content_tag(:span, class: ['tag', status_tag_class_for_order(order)]) do
      status_tag_for_order(order)
    end
  end

  def status_tag_for_order(order)
    Order.human_attribute_name("status.#{order.status}")
  end

  def status_tag_class_for_order(order)
    case order.status
    when 'processing' then 'tag-warning'
    when 'completed' then 'tag-success'
    when 'canceled' then 'tag-danger'
    end
  end
end
