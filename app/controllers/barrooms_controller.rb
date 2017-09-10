class BarroomsController < ApplicationController
  def show
    @barroom = Barroom.find(params[:id])
  end
  def new
    @barroom = Barroom.new
  end

  def create
    @barroom = Barroom.new(barroom_params)
    respond_to do |format|
      if @barroom.save
        @barroom.barroom_users.where(user_id: current_user.id).first_or_create
        format.html { redirect_to @barroom, notice: 'Barroom was successfully created.' }
        format.json { render :show, status: :created, location: @barroom }
      else
        format.html { render :new }
        format.json { render json: @barroom.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def barroom_params
      params.require(:barroom).permit(:name)
    end
end
