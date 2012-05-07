class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.voucher_created.subject
  #
  def voucher_created(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject =>  "Latest Offer Information"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.voucher_redeemed.subject
  #
  def voucher_redeemed_customer(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject => "Thank you for your purchase!"  
  end

  def voucher_redeemed_business(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject => "Receipt for transaction..`"  
  end
end
