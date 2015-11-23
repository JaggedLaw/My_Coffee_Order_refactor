 require_relative 'cart_coffee'
class Cart
  attr_reader :contents

  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def minus_item(item_id)
    if contents[item_id.to_s] >= 1
      contents[item_id.to_s] -= 1
      contents.keep_if { |key,value| value >= 1 }
    end
  end

  def sum
    drinks.map {|drink| drink.sum}.reduce(:+)
  end

  def total_quantity
    drinks.map {|drink| drink.quantity}.reduce(:+)
  end

  def drinks
    contents.map do |item_id, quantity|
    item = Item.find(item_id)
    sum = item.price * quantity
    CartCoffee.new(item, quantity, sum)
    end
  end

  def cart_items
    contents.map do |item_id, quantity|
     Item.find(item_id)
    end
  end
end
