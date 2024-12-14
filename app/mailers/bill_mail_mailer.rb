# frozen_string_literal: true

class BillMailMailer < ApplicationMailer
  default from: ENV['admin_mail_id']

  def submission(user_id)
    usermail = User.find(id: user_id).email
    mail(to: usermail, subject: 'Payment Day')
  end
end
