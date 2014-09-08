require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :products
  fixtures :carts

  test "cart line item should save price " do
    cart = carts(:cart1)
    [:ruby, :loremipsum, :ruby].each do |which_product|
      product = products(which_product)
      item = cart.add_product product.id
      assert_equal item.price, product.price, "cart line item did not save price"
    end
  end

  test "cart line item quantity should increment" do
    cart = carts(:cart2)
    product = products(:ruby)
    multiple = 3
    multiple.times { cart.add_product product.id }
    item = cart.line_items.find_by_product_id product.id
    assert_equal multiple, item.quantity, "cart line item quantity is incorrect"
  end


end
