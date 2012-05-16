class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.voucher_created.subject
  #
  

  def signup_received(customer)
    @customer = customer

    mail :to => customer.email, :subject => "Thank you"
  end

  def org_app_received (organization)
    @organization = organization

    mail :to => organization.email, :subject => "Thank you for your application"
  end

  def forward_org_app (organization)
    @organization = organization

    mail :to => "noahfarb@gmail.com", :subject => "Another Non-Profit Application!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.voucher_redeemed.subject
  #

  def voucher_created(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject =>  "Your Offer Code and Information"
  end

  def voucher_redeemed_customer(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject => "Thank you for your purchase!"  
  end

  def voucher_redeemed_business(voucher)
    @voucher = voucher
    mail :to => voucher.email, :subject => "Receipt for transaction..`"  
  end
end
