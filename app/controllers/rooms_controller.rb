class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @room = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to rooms_path, alert: '不正なアクセスです！'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:title, :content, :genre, :age, :purpose, :image)
  end

end
