class RotationsController < ApplicationController
  
  before_filter :build_rotation, :only => [:new, :create]
  before_filter :find_rotation, :only => [:show, :edit, :update, :destroy]

  def index
    @rotations = Rotation.order('id DESC')
    @teams = Team.all.sort_by { |team| [-team.rotations.sum(:participation_value), -team.win_percentage(team.rotations.last), team.name] }
  end

  def show; end

  def new; end
  
  def edit; end
  
  def create
    if @rotation.save
      flash[:notice] = 'Rotation was successfully created.'
      redirect_to(@rotation)
    else
      render(:action => "new")
    end
  end

  def update
   if @rotation.update_attributes(params[:rotation])
      flash[:notice] = 'Rotation was successfully updated.'
      redirect_to(@rotation)
    else
      render(:action => "edit")
    end
  end

  def destroy
    @rotation.destroy
    redirect_to(rotations_url)
  end
  
  protected
  
  def build_rotation
    @rotation = Rotation.new(params[:rotation])
    @teams = Team.all
    @fleets = Fleet.all
  end
  
  def find_rotation
    @rotation = Rotation.includes(:races, :entries => [:team, {:fleet => :boats}]).find(params[:id])
  end
end
