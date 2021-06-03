class BasketController < ActionController::API
  
  require 'securerandom'
  require 'receipt'

  def create
    
    uuid = SecureRandom.uuid

    render json: {basket_id: uuid}

  end

  def add
    
   trans_id = params[:id]
   item_name = params[:item_name]
   puts "TRANSID: " + trans_id
   puts "PARAMS: " + params.inspect
   puts "item name: " + item_name

   @existing_item = Basket.find_by(trans_id: trans_id, item_name: item_name)
puts "made it past test"
puts "EI: " + @exiting_item.inspect

   @new_item = Basket.new

   puts "EI2: " + @existing_item.inspect
   unless @existing_item.nil?
puts "Item exists"
     @existing_item.item_quantity = @existing_item.item_quantity + 1
     @existing_item.save!
   else
puts "Item does not exist"
     @new_item.trans_id = trans_id
     @new_item.item_name = item_name
     @new_item.item_price = params[:item_price]
     @new_item.item_quantity = 1
     @new_item.food_or_medical = params[:food_or_medical]
     @new_item.imported = params[:imported]

     @new_item.save!
   end

   if @existing_item.nil?
     render json: @new_item
   else
     render json: @existing_item
   end
    
  end

  def checkout
    basket_id = params[:id]

    puts "BASKET_ID: " + basket_id
    line_items = Basket.where("trans_id = ?", basket_id)
    puts "FOUND: " + line_items.count.to_s

    receipt = Receipt.new(line_items)

    render json: receipt

  end

end

