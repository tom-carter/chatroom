class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :other_people, ->(user) { where.not(id: user) }
  scope :should_be_mailed, ->() { where("last_mailed_at IS NULL OR last_mailed_at < ?", Date.today - 6.days) }

  after_create_commit { broadcast_append_to "users" }

  validates_presence_of :handle

  has_many :messages

  def last_message_sent_time
    messages.order(:created_at).last&.created_at || created_at
  end
end
