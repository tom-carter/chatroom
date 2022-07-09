class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    @current_user = current_user
    @message = @current_user.messages.create(body: message_params[:body])
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
