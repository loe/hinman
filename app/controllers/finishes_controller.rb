class FinishesController < ApplicationController
  
  before_filter :load_race
  
  def edit
    
  end
  
  def update
  end
  
  protected
    
  def load_race
    @race = Race.find(params[:race_id])
  end
end
