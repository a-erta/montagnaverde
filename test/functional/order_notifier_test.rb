require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Montagna Verde Order Confirmation", mail.subject
    assert_equal ["alessandro.erta@gmail.com"], mail.to
    assert_equal ["alessandro.erta@gmail.com"], mail.from
    assert_match "Miele di Acacia", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Montagna Verde Order Shipped", mail.subject
    assert_equal ["alessandro.erta@gmail.com"], mail.to
    assert_equal ["alessandro.erta@gmail.com"], mail.from
    assert_match "Miele di Acacia", mail.body.encoded
  end

end