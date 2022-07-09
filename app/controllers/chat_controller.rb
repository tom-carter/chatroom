class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.other_people(current_user)
    @messages = Message.order(:created_at).all
    @message = Message.new
  end
end