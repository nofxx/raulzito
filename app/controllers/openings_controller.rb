class OpeningsController < ApplicationController
  # GET /openings
  # GET /openings.xml
  def index
    @openings = Opening.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @openings }
    end
  end

  # GET /openings/1
  # GET /openings/1.xml
  def show
    @opening = Opening.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @opening }
    end
  end

  # GET /openings/new
  # GET /openings/new.xml
  def new
    @opening = Opening.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @opening }
    end
  end

  # GET /openings/1/edit
  def edit
    @opening = Opening.find(params[:id])
  end

  # POST /openings
  # POST /openings.xml
  def create
    @opening = Opening.new(params[:opening])

    respond_to do |format|
      if @opening.save
        flash[:notice] = 'Opening was successfully created.'
        format.html { redirect_to(@opening) }
        format.xml  { render :xml => @opening, :status => :created, :location => @opening }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opening.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /openings/1
  # PUT /openings/1.xml
  def update
    @opening = Opening.find(params[:id])

    respond_to do |format|
      if @opening.update_attributes(params[:opening])
        flash[:notice] = 'Opening was successfully updated.'
        format.html { redirect_to(@opening) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @opening.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1
  # DELETE /openings/1.xml
  def destroy
    @opening = Opening.find(params[:id])
    @opening.destroy

    respond_to do |format|
      format.html { redirect_to(openings_url) }
      format.xml  { head :ok }
    end
  end
end
