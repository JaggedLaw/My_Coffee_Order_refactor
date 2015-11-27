require 'test_helper'

class VistorCanViewItemsTest < ActionDispatch::IntegrationTest

  def create_items(num)
    num.times do
      Item.create(title: "latte", description: 'forthy deliciousness', price: 4.00, image: "google.com")
    end
  end

  test 'an unregistered user can view items' do
    create_items(3)
    visit items_path


    assert page.has_content?('Latte')
  end

  test 'an unregistered user can view a single item' do
    create_category_and_items(2)
    visit items_path
    
    click_link('Drip1')
    assert '/items/#{item.id}', current_path

    assert page.has_content?('it taste good')
  end
end
