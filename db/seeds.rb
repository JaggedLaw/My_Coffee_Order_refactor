class Seed
  def self.start
    new.generate
  end

  def generate
    create_category
    create_item
    create_admin
    create_registered_user
  end

  def create_category
    @category1 = Category.create(name: "Coffee")
    @category2 = Category.create(name: "Latte")
    @category3 = Category.create(name: "Espresso")
    @category4 = Category.create(name: "Tea")
    puts "category created"
  end

  def create_item
    @category1.items.create(title: "Fresh Brewed Coffee", description: "Black Coffee roasted and brewed in house", price:2, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSgSHt_eNeOtwj7YfD2pzb936T-p967kHRdSVz0rFAijRxQtCP_Kg")
    @category3.items.create(title: "Espresso shot", description: "A shot of espresso skillfully pulled by your barista", price:3, image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQobXI0QMDBTa-qs27YXoXzH1mwoAnlafJExoW3Y86sGoZ4Xo50Cg")
    @category2.items.create(title: "Chai Tea Latte", description: "Aromic black tea served as a creamy sweat latte.", price: 5, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSH-SgrF3bSunZIVfCuOtF2ENmJaDcNreEbvanX4CC1ivzVgfMC")
    @category2.items.create(title: "Mocha Latte", description: "Hot chocolate and a shot of espresso brewed up in this tasty latte", price: 4, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkDBRWKJ5ZZShWt9U8RKQVXtObCbyF_KvQzI4ApXr9ral44EXT")
    @category3.items.create(title: "Americano", description: "A smooth coffee that mixes shots of espress with hot water", price:2, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMNSxUtudEdAWOJWjG-Jb7MrR37jd1teNNFAdN3JA-SdMuji35")
    @category3.items.create(title: "Cappucino", description: "Espresso with steamed, frothy milk and chocolate dusting.", price:4, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRNSXFMdDggKNp-u3LkdJuUxuzXTXL21MgSOWms4NGQaW_T0Mlq")
    @category4.items.create(title: "Tea", description: "our signature English Breakfast tea", price: 2, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuozcuZZYXrQpEJe0u1XOIl0g86R4ppXAvv3_yIyilkuX2F0wV")
    @category3.items.create(title: "Macchiato", description: "two shots of espresso and some steamed milk", price: 3, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSSuvRAQORZqtyF1r2770nPSMGBoh_W8rGcArd-SowSv3kzIY5p")

    puts "items created."
  end

  def create_admin
    User.create(username: "admin", password: "pw", role: 1, address: "adminland", city: "Denver", state: "CO", zip: 83020)

    puts "admin created"
  end

  def create_registered_user
    @user1 =  User.create(username: "ryan", password: "waffles", role: 0, address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
    @user2 =  User.create(username: "jhun", password: "dana", role: 0, address: "denver roadd", city: "Denver", state: "CO", zip: 82021)
    @user3 =  User.create(username: "charissa", password: "coffee", role: 0, address: "coolvilled", city: "Denver", state: "CO", zip: 83020)
    @user4 =  User.create(username: "rachel", password: "cello", role: 0, address: "coolvilled", city: "Denver", state: "CO", zip: 83020)

    puts "registered user created"
  end

  # def create_orders
  #   @order1 =
  # end

  def order_items
    @order1 = @category1.items.create(title: "Fresh Brewed Coffee", description: "Black Coffee roasted and brewed in house", price:2, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSgSHt_eNeOtwj7YfD2pzb936T-p967kHRdSVz0rFAijRxQtCP_Kg")
    #
    # @order2 = @category3.items.create(title: "Cappucino", description: "Espresso with steamed, frothy milk and chocolate dusting.", price:4, image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRNSXFMdDggKNp-u3LkdJuUxuzXTXL21MgSOWms4NGQaW_T0Mlq"),
    #
    # @order3 = @category3.items.create(title: "Americano", description: "A smooth coffee that mixes shots of espress with hot water", price:2, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMNSxUtudEdAWOJWjG-Jb7MrR37jd1teNNFAdN3JA-SdMuji35"),
    #
    #
    # @order4 = @category1.items.create(title: "Fresh Brewed Coffee", description: "Black Coffee roasted and brewed in house", price:2, image: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSgSHt_eNeOtwj7YfD2pzb936T-p967kHRdSVz0rFAijRxQtCP_Kg")
    #
  end
end

Seed.start
