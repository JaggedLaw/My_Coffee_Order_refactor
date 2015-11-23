class CartTest < ActiveSupport::TestCase
  test 'cart has initial contents' do
    cart = Cart.new({ "1" => 1})

    assert_equal({ "1" => 1}, cart.contents)
  end

  test 'can add an item' do
    cart = Cart.new({ "1" => 1})

    cart.add_item(1)
    cart.add_item(2)

    assert_equal({ "1" => 2, "2" => 1}, cart.contents)
  end

  test 'can minus_item from cart' do
    cart = Cart.new({ "1" => 1})
    cart.add_item(1)
    cart.add_item(2)
    cart.minus_item(2)

    assert_equal({ "1" =>2 }, cart.contents)
  end

  test 'cart can give me the total sum of the items in cart' do
    drink1 = Item.create(title:"drip", description: 'yum', price: 4, image:'google.com')

    drink2 = Item.create(title:"coffee", description: 'yums', price: 4, image:'google.com')

    cart = Cart.new({})

    cart.add_item(drink1.id)
    cart.add_item(drink2.id)



    assert_equal(8, cart.sum)
  end

  test 'cart can add total quantity ' do
    drink1 = Item.create(title:"drip", description: 'yum', price: 4, image:'google.com')

    drink2 = Item.create(title:"coffee", description: 'yums', price: 4, image:'google.com')

    cart = Cart.new({})

    cart.add_item(drink1.id)
    cart.add_item(drink2.id)

    cart.total_quantity

    assert_equal(2, cart.total_quantity)
  end

  test 'you can see the drinks you added to your cart' do
    drink1 = Item.create(title:"drip", description: 'yum', price: 4, image:'google.com')
    drink2 = Item.create(title:"coffee", description: 'yums', price: 4, image:'google.com')

    cart = Cart.new({})

    cart.add_item(drink1.id)
    cart.add_item(drink2.id)

    expected  = cart.drinks.first.title
    expected2 = cart.drinks.last.title

    assert_equal("drip", expected)
    assert_equal("coffee",expected2)
  end

  test 'cart_item returns items in cart' do
    drink1 = Item.create(title:"drip", description: 'yum', price: 4, image:'google.com')
    drink2 = Item.create(title:"coffee", description: 'yums', price: 4, image:'google.com')

    cart = Cart.new({})

    cart.add_item(drink1.id)
    cart.add_item(drink2.id)

    expected1 = cart.cart_items.first.price
    expected2 = cart.cart_items.last.title

    assert_equal(4, expected1)
    assert_equal("coffee", expected2)
  end

end
