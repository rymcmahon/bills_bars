class BarroomsController < ApplicationController
  before_action :set_barroom, only: [:show]

  def index
    @barrooms = Barroom.public_channels
  end

  def show
    @messages = @barroom.messages.order(created_at: :desc).limit(100).reverse
    @barroom_user = current_user.barroom_users.find_by(barroom_id: @barroom.id)
    @barrooms = Barroom.all
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

    def set_barroom
      @barroom = Barroom.find(params[:id])
    end

    def barroom_params
      params.require(:barroom).permit(:name)
    end
end
