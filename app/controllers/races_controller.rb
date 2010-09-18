class RacesController < ApplicationController
  
  before_filter :load_rotation
  
  def show
    @race = @rotation.races.find(params[:id])
  end
  
  protected
  
  def load_rotation
    @rotation = Rotation.find(params[:rotation_id])
  end
  
end
