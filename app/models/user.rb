class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :other_people, ->(user) { where.not(id: user) }

  after_create_commit { broadcast_append_to "users" }

  validates_presence_of :handle
end
