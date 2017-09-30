class DirectMessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    users = [current_user, User.find(params[:id])]
    @barroom = Barroom.direct_message_for_users(users)
    @messages = @barroom.messages.order(created_at: :desc).limit(100).reverse
    @barroom_user = current_user.barroom_users.find_by(barroom_id: @barroom.id)
    render "barrooms/show"
  end

end
