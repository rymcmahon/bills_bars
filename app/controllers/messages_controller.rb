class MessagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_barroom

  def create
    message = @barroom.messages.new(message_params)
    message.user = current_user
    message.save
    redirect_to @barroom
  end

  private

    def set_barroom
      @barroom = Barroom.find(params[:barroom_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end