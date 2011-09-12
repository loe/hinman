class TeamsController < ApplicationController

  def index
    @teams = Team.where('name != ?', 'Bye')
  end

  def show
    @team = Team.find(params[:id])
  end

end
