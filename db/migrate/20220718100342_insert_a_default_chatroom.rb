class InsertADefaultChatroom < ActiveRecord::Migration[7.0]
  class Chatroom < ApplicationRecord; end
  def up
    Chatroom.create(name: 'General Chat')
  end

  def down
    Chatroom.destroy_all
  end
end
