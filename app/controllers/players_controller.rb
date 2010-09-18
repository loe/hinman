class PlayersController < ApplicationController
  
  before_filter :load_team
  
  def index
    @players = @team.players
  end

  def show
    @player = @team.players.find(params[:id])
  end

  def edit
    @player = @team.players.find(params[:id])
  end

  def update
    @player = @team.players.find(params[:id])

    if @player.update_attributes(params[:player])
      flash[:notice] = 'Player was successfully updated.'
      redirect_to(team_player_path(@team, @player))
    else
      render(:action => "edit")
    end
  end
  
  protected
  
  def load_team
    @team = Team.find(params[:team_id])
  end
  
end
