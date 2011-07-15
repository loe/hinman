class RotationsController < ApplicationController
  
  before_filter :ensure_admin, :except => [:index, :show, :multiple]
  before_filter :build_rotation, :only => [:new, :create]
  before_filter :find_rotation, :only => [:show, :edit, :update, :destroy]
  
  def index
    @rotations = Rotation.order('updated_at DESC')
    @teams = Team.all.sort_by do |team| 
      [
        -team.rotations.sum(:participation_value),
        -team.win_percentage(team.rotations.last),
        -team.tie_break_points,
        team.name
      ]
    end
  end

  def show; end
  
  # Weave multiple rotations together.
  def multiple
    @rotations = Rotation.includes(:races, :entries => [:team, {:fleet => :boats}]).where(:id => params[:id].split('/'))
    rotation_races = @rotations.map(&:races)
    
    @races = []
    while rotation_races.any?(&:present?)
      rotation_races.each do |races|
        2.times { @races << races.shift }
      end
    end
  end
  
  def new; end
  
  def edit
    @fleets = Fleet.all
  end
  
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
