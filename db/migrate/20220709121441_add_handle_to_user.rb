class AddHandleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :handle, :string, null: false
  end
end
