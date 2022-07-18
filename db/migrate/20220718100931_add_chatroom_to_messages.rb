class AddChatroomToMessages < ActiveRecord::Migration[7.0]
  class Chatroom < ApplicationRecord; end
  class Message < ApplicationRecord; end
  def change
    add_reference :messages, :chatroom, null: true
    chatroom_id = Chatroom.find_by_name('General Chat').id
    Message.update_all(chatroom_id: chatroom_id)
    change_column_null :messages, :chatroom_id, false
  end
end
