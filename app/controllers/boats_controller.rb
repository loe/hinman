class BoatsController < ApplicationController
  
  before_filter :load_fleet
  
  def index
    @boats = @fleet.boats
  end

  def show
    @boat = @fleet.boats.find(params[:id])
  end
  
  protected
  
  def load_fleet
    @fleet = Fleet.find(params[:fleet_id])
  end
  
end
