class UserMailer < ApplicationMailer
  default from: "logistics@gmail.com"
  def signup_confirmation(details)
    @details = details
    mail to: "muthukumar422dce@gmail.com" , subject: "New Order From client"
  end
  def booked_confirmation(orderid,mailid)
  	@details=orderid
  	mail to: mailid , subject:  "Order confirmed"
  end
end