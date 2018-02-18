class ContactMailer < ApplicationMailer
  def contact_mail(contact)
   @contact = contact

   mail to: ENV['EMAIL'], subject: "Jobmiruへのお問い合わせ"
 end
end
