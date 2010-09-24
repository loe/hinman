class PlayersController < ApplicationController
  
  before_filter :load_team
  
  def show
    @player = @team.players.find(params[:id])
  end
  
  protected
  
  def load_team
    @team = Team.find(params[:team_id])
  end
  
end
