class BarroomUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_barroom

  def create
  end

  def destroy
  end

  private

    def set_barroom
      @barroom = Barroom.find(params[:barroom_id])
    end
end
