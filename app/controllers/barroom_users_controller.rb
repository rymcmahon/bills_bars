class BarroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_barroom

  def create
    @barroom_user = @barroom.barroom_users.where(user_id: current_user.id).first_or_create
    redirect_to @barroom
  end

  def destroy
    @barroom_user = @barroom.barroom_users.where(user_id: current_user.id).destroy_all
    redirect_to barrooms_path
  end

  private

    def set_barroom
      @barroom = Barroom.find(params[:barroom_id])
    end
end
