

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

      current_item_total = purchase_item.item_price * purchase_item.item_quantity
      item_total += receipt_line.item_cost 
      item_tax_rate = purchase_item.tax_rate
      tax_total += current_item_total * item_tax_rate
    end
    
    self.header.receipt_dttm = DateTime.current.strftime("%d/%m/%y %H:%M:%S")
    self.header.item_totals = item_total.to_d
    self.header.tax_total = tax_total.to_d
    self.header.purchase_total = (item_total + tax_total).to_d


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
    self.tax_amount = BigDecimal((line_item.item_price * item_quantity.to_f * tax_rate).to_s)
    self.item_cost = round_to_fives(BigDecimal((line_item.item_price * item_quantity.to_f + self.tax_amount).to_s))
  end

  def round_to_fives(value)

    int_version = (value * 100).to_i

    last_digit = int_version % 10

    if last_digit >= 3 and last_digit <= 7
      # rount to 5
      int_version = int_version - last_digit + 5
    else
      #round to nearest 10
      int_version = int_version.round(-1)
    end

    return int_version.to_d / 100

  end


end

