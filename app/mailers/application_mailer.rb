# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['admin_mail_id']
  layout 'mailer'
end
