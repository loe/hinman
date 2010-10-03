class TeamsController < ApplicationController

  def index
    @teams = Team.real
  end

  def show
    @team = Team.find(params[:id])
  end

end
