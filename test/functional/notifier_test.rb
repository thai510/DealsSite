require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "voucher_created" do
    mail = Notifier.voucher_created
    assert_equal "Voucher created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "voucher_redeemed" do
    mail = Notifier.voucher_redeemed
    assert_equal "Voucher redeemed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
