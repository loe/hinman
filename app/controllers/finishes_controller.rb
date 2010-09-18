class FinishesController < ApplicationController
  
  before_filter :load_race
  
  def show
    
  end
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  protected
    
  def load_race
    @race = Race.find(params[:race_id])
  end
end
