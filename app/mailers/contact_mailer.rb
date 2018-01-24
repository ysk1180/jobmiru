class ContactMailer < ApplicationMailer
  def contact_mail(contact)
   @contact = contact

   mail to: "ysk1180@gmail.com", subject: "Jobmiruへのお問い合わせ"
 end
end
