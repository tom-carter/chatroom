class Message < ApplicationRecord
  after_create_commit { broadcast_append_to "messages" }
  belongs_to :user
end
