class RotationsController < ApplicationController
  
  def index
    @rotations = Rotation.all
  end

  def show
    @rotation = Rotation.find(params[:id])
  end

  def new
    @rotation = Rotation.new
    @teams = Team.all
    @fleets = Fleet.all
  end
  
  def edit
    @rotation = Rotation.find(params[:id])
  end
  
  def create
    @rotation = Rotation.new(params[:rotation])

    if @rotation.save
      flash[:notice] = 'Rotation was successfully created.'
      redirect_to(@rotation)
    else
      render(:action => "new")
    end
  end

  def update
    @rotation = Rotation.find(params[:id])

   if @rotation.update_attributes(params[:rotation])
      flash[:notice] = 'Rotation was successfully updated.'
      redirect_to(@rotation)
    else
      render(:action => "edit")
    end
  end

  def destroy
    @rotation = Rotation.find(params[:id])
    @rotation.destroy
    redirect_to(rotations_url)
  end
end
