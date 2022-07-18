class InsertADefaultChatroom < ActiveRecord::Migration[7.0]
  class Room < ApplicationRecord; end
  def up
    Room.create(name: 'General Chat')
  end

  def down
    Room.destroy_all
  end
end
