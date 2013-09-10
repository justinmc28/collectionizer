module FrontHelper
  
  def top_five(all_orders)
    orders = all_orders.order("amount_in_cents DESC").limit(5)
  end
  
  def average(all_orders)
    average = all_orders.average("amount_in_cents")
    money(average)
  end
  
  def name(order)
    last_name = truncate(order.l_name, length: 2, omission: '.')
    if order.anonymous
      "Anonymous"
    else
      "#{order.f_name.titleize} #{last_name.titleize}"
    end
  end
  
end
