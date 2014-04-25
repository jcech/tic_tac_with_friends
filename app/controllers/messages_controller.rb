class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def create
    @message = Message.create(message_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
