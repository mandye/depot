class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
    end
    current_item
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty" )
  end

  def total_price
    items.inject(0){ |total, item| total + item.price  }
  end

  def total_items
    @items.sum { |item| item.quantity }
  end
end