class ChatController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.other_people(current_user)
  end
end