class FleetsController < ApplicationController
  # GET /fleets
  # GET /fleets.xml
  def index
    @fleets = Fleet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fleets }
    end
  end

  # GET /fleets/1
  # GET /fleets/1.xml
  def show
    @fleet = Fleet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fleet }
    end
  end

  # GET /fleets/new
  # GET /fleets/new.xml
  def new
    @fleet = Fleet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fleet }
    end
  end

  # GET /fleets/1/edit
  def edit
    @fleet = Fleet.find(params[:id])
  end

  # POST /fleets
  # POST /fleets.xml
  def create
    @fleet = Fleet.new(params[:fleet])

    respond_to do |format|
      if @fleet.save
        flash[:notice] = 'Fleet was successfully created.'
        format.html { redirect_to(@fleet) }
        format.xml  { render :xml => @fleet, :status => :created, :location => @fleet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fleet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fleets/1
  # PUT /fleets/1.xml
  def update
    @fleet = Fleet.find(params[:id])

    respond_to do |format|
      if @fleet.update_attributes(params[:fleet])
        flash[:notice] = 'Fleet was successfully updated.'
        format.html { redirect_to(@fleet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fleet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fleets/1
  # DELETE /fleets/1.xml
  def destroy
    @fleet = Fleet.find(params[:id])
    @fleet.destroy

    respond_to do |format|
      format.html { redirect_to(fleets_url) }
      format.xml  { head :ok }
    end
  end
end
