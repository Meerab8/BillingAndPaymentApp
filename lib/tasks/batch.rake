# frozen_string_literal: true

namespace :batch do
  desc 'Sent Mail at the end of the month '
  task send_messages: :environment do
    BillMailMailer.submission(user_id)
  end
end
