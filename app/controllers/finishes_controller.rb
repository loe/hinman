class FinishesController < ApplicationController
  
  before_filter :load_race
  
  def edit; end
  
  def update
    if @race.update_attributes(params[:race])
      flash[:notice] = "Results for Race ##{@race.id} successfully recorded."
      redirect_to(edit_rotation_race_finish_path(@race.rotation, @race.next))
    else
      render(:action => "edit")
    end
  end
  
  protected
  
  def load_race
    @race = Race.find(params[:race_id])
  end
end
