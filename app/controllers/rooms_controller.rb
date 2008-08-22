class RoomsController < ApplicationController
  before_filter :login_required
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.create(params[:room])
    if @room.save
      flash[:notice] = "Room created"
      redirect_to root_path
    else
      render :action => "new"
    end
  end
  
  def edit
    @room = Room.find(params[:id])    
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update_attributes(params[:room])
    if @room.save
      flash[:notice] = "Room updated"
      redirect_to root_path
    else
      render :action => "edit"
    end
  end
  
end