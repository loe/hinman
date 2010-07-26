class RotationsController < ApplicationController
  # GET /rotations
  # GET /rotations.xml
  def index
    @rotations = Rotation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rotations }
    end
  end

  # GET /rotations/1
  # GET /rotations/1.xml
  def show
    @rotation = Rotation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rotation }
    end
  end

  # GET /rotations/new
  # GET /rotations/new.xml
  def new
    @rotation = Rotation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rotation }
    end
  end

  # GET /rotations/1/edit
  def edit
    @rotation = Rotation.find(params[:id])
  end

  # POST /rotations
  # POST /rotations.xml
  def create
    @rotation = Rotation.new(params[:rotation])

    respond_to do |format|
      if @rotation.save
        flash[:notice] = 'Rotation was successfully created.'
        format.html { redirect_to(@rotation) }
        format.xml  { render :xml => @rotation, :status => :created, :location => @rotation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rotation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rotations/1
  # PUT /rotations/1.xml
  def update
    @rotation = Rotation.find(params[:id])

    respond_to do |format|
      if @rotation.update_attributes(params[:Rotation])
        flash[:notice] = 'Rotation was successfully updated.'
        format.html { redirect_to(@rotation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rotation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rotations/1
  # DELETE /rotations/1.xml
  def destroy
    @rotation = Rotation.find(params[:id])
    @rotation.destroy

    respond_to do |format|
      format.html { redirect_to(rotations_url) }
      format.xml  { head :ok }
    end
  end
end
