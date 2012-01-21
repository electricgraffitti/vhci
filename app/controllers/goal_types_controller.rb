class GoalTypesController < ApplicationController
  
  before_filter :require_user
  
  layout "admin"
  
  # GET /goal_types
  # GET /goal_types.xml
  def index
    @goal_types = GoalType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goal_types }
    end
  end

  # GET /goal_types/1
  # GET /goal_types/1.xml
  def show
    @goal_type = GoalType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal_type }
    end
  end

  # GET /goal_types/new
  # GET /goal_types/new.xml
  def new
    @goal_type = GoalType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goal_type }
    end
  end

  # GET /goal_types/1/edit
  def edit
    @goal_type = GoalType.find(params[:id])
  end

  # POST /goal_types
  # POST /goal_types.xml
  def create
    @goal_type = GoalType.new(params[:goal_type])

    respond_to do |format|
      if @goal_type.save
        flash[:notice] = 'GoalType was successfully created.'
        format.html { redirect_to(@goal_type) }
        format.xml  { render :xml => @goal_type, :status => :created, :location => @goal_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @goal_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /goal_types/1
  # PUT /goal_types/1.xml
  def update
    @goal_type = GoalType.find(params[:id])

    respond_to do |format|
      if @goal_type.update_attributes(params[:goal_type])
        flash[:notice] = 'GoalType was successfully updated.'
        format.html { redirect_to(@goal_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goal_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_types/1
  # DELETE /goal_types/1.xml
  def destroy
    @goal_type = GoalType.find(params[:id])
    @goal_type.destroy

    respond_to do |format|
      format.html { redirect_to(goal_types_url) }
      format.xml  { head :ok }
    end
  end
end
