class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :other_people, ->(user) { where.not(id: user) }

  after_create_commit { broadcast_append_to "users" }

  validates_presence_of :handle

  has_many :messages

  def last_message_sent_time
    messages.order(:created_at).last&.created_at || created_at
  end
end
