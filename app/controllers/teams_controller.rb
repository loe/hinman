class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      flash[:notice] = 'Team was successfully updated.'
      redirect_to(@team)
    else
      render(:action => "edit")
    end
  end
end
