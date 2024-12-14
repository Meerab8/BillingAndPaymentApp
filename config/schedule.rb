# frozen_string_literal: true

every 1.minute do
  rake 'batch:send_messages'
end
