require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
fixtures :products
# A user goes to the index page. They select a product, adding it to their
# cart, and check out, filling in their details on the checkout form. When
# they submit, an order is created containing their information, along with a
# single line item corresponding to the product they added to their cart.

test "buying a product" do
LineItem.delete_all
Order.delete_all
ruby_book = products(:miele_acacia)
get "/"
assert_response :success
assert_template "index"
xml_http_request :post, '/line_items', :product_id => ruby_book.id
assert_response :success
cart = Cart.find(session[:cart_id])
assert_equal 1, cart.line_items.size
assert_equal ruby_book, cart.line_items[0].product
get "/orders/new"
assert_response :success
assert_template "new"

post_via_redirect "/orders",
:order => { :name => "Alessandro Erta",
:address => "MyText",
:email => "alessandro.erta@gmail.com",
:pay_type => "Check" }
assert_response :success
assert_template "index"
cart = Cart.find(session[:cart_id])
assert_equal 0, cart.line_items.size
orders = Order.all
assert_equal 1, orders.size
order = orders[0]
assert_equal "Alessandro Erta", order.name
assert_equal "MyText", order.address
assert_equal "alessandro.erta@gmail.com", order.email
assert_equal "Check", order.pay_type
assert_equal 1, order.line_items.size
line_item = order.line_items[0]
assert_equal ruby_book, line_item.product
mail = ActionMailer::Base.deliveries.last
assert_equal ["alessandro.erta@gmail.com"], mail.to
assert_equal 'Alessandro Erta <alessandro.erta@gmail.com>', mail[:from].value
assert_equal "Montagna Verde Order Confirmation", mail.subject
end
end
