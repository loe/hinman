class BoatsController < ApplicationController
  
  before_filter :load_fleet
  
  # GET /boats
  # GET /boats.xml
  def index
    @boats = @fleet.boats

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boats }
    end
  end

  # GET /boats/1
  # GET /boats/1.xml
  def show
    @boat = @fleet.boats.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @boat }
    end
  end

  # GET /boats/new
  # GET /boats/new.xml
  def new
    @boat = @fleet.boats.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @boat }
    end
  end

  # GET /boats/1/edit
  def edit
    @boat = @fleet.boats.find(params[:id])
  end

  # POST /boats
  # POST /boats.xml
  def create
    @boat = @fleet.boats.build(params[:boat])

    respond_to do |format|
      if @boat.save
        flash[:notice] = 'Boat was successfully created.'
        format.html { redirect_to(fleet_boat_path(@fleet, @boat)) }
        format.xml  { render :xml => @boat, :status => :created, :location => @boat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @boat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /boats/1
  # PUT /boats/1.xml
  def update
    @boat = @fleet.boats.find(params[:id])

    respond_to do |format|
      if @boat.update_attributes(params[:boat])
        flash[:notice] = 'Boat was successfully updated.'
        format.html { redirect_to(fleet_boat_path(@fleet, @boat)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @boat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.xml
  def destroy
    @boat = @fleet.boats.find(params[:id])
    @boat.destroy

    respond_to do |format|
      format.html { redirect_to(fleet_boats_path(@fleet)) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def load_fleet
    @fleet = Fleet.find(params[:fleet_id])
  end
end
