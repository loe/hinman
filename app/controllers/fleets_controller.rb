class FleetsController < ApplicationController
  
  def index
    @fleets = Fleet.all
  end
  
  def show
    @fleet = Fleet.find(params[:id])
  end
  
end
