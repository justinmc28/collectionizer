module ApplicationHelper
  
  def money(cents)
     total = cents.to_f / 100
     precise_total = number_with_precision(total, :precision => 2)
     "$#{precise_total}"
   end
   
   def money_no_sign(cents)
      total = cents.to_f / 100
      precise_total = number_with_precision(total, :precision => 2)
      "#{precise_total}"
   end
   
  
end
