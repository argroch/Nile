class Notifier < ActionMailer::Base
  default from: "no-reply@nile.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_confirmation_email.subject
  #
  def order_confirmation_email(customer)
    @customer = customer

    mail to: @customer.email, subject: 'Your Order Confirmation'
  end
end
