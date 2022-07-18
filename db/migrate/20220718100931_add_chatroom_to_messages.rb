class AddChatroomToMessages < ActiveRecord::Migration[7.0]
  class Room < ApplicationRecord; end
  class Message < ApplicationRecord; end
  def change
    add_reference :messages, :room, null: true
    Message.update_all(room_id: Room.find_by_name('General Chat').id)
    change_column_null :messages, :room_id, false
  end
end
