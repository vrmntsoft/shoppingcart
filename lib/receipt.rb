class Receipt

 attr_accessor :header
 attr_accessor :lines

  def initialize(purchase_items)
    self.header = ReceiptHeader.new
    self.lines = Array.new

    item_total = 0.0
    tax_total = 0.0
    purchase_total = 0.0


    purchase_items.each do |purchase_item|
      receipt_line = ReceiptLine.new(purchase_item)
      self.lines << receipt_line
      puts "adding to totals: " + purchase_item.inspect


      current_item_total = purchase_item.item_price * purchase_item.item_quantity
      item_total += current_item_total
      item_tax_rate = purchase_item.tax_rate
      puts "its the tax rate: " + item_tax_rate.inspect
      tax_total += current_item_total * item_tax_rate
puts "past totals"
    end
    
    self.header.receipt_dttm = Date.current
    self.header.item_totals = item_total
    self.header.tax_total = tax_total
    self.header.purchase_total = item_total + tax_total

  end

end

class ReceiptHeader
  attr_accessor :receipt_dttm
  attr_accessor :item_totals
  attr_accessor :tax_total
  attr_accessor :purchase_total
end

class ReceiptLine
  attr_accessor :item_name
  attr_accessor :item_quantity
  attr_accessor :item_cost
  attr_accessor :tax_amount

  def initialize(line_item)
    self.item_name = line_item.item_name
    self.item_quantity = line_item.item_quantity
    tax_rate =  line_item.tax_rate
    self.tax_amount = line_item.item_price * item_quantity.to_f * tax_rate 
    self.item_cost = (line_item.item_price * item_quantity.to_f) + tax_amount
  end

end

