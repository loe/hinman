class RacesController < ApplicationController
  
  before_filter :load_rotation
  
  # GET /races
  # GET /races.xml
  def index
    @races = @rotation.races

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @races }
    end
  end

  # GET /races/1
  # GET /races/1.xml
  def show
    @race = @rotation.races.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /races/new
  # GET /races/new.xml
  def new
    @race = @rotation.races.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @race }
    end
  end

  # GET /races/1/edit
  def edit
    @race = @rotation.races.find(params[:id])
  end

  # POST /races
  # POST /races.xml
  def create
    @race = @rotation.races.build(params[:race])

    respond_to do |format|
      if @race.save
        flash[:notice] = 'Race was successfully created.'
        format.html { redirect_to(rotation_race_path(@rotation, @race)) }
        format.xml  { render :xml => @race, :status => :created, :location => @race }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /races/1
  # PUT /races/1.xml
  def update
    @race = @rotation.races.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        flash[:notice] = 'Race was successfully updated.'
        format.html { redirect_to(rotation_race_path(@rotation, @race)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.xml
  def destroy
    @race = @rotation.races.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to(rotation_races_path(@rotation)) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_rotation
    @rotation = Rotation.find(params[:rotation_id])
  end
  
end
