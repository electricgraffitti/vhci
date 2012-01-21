class DocumentsController < ApplicationController
  
  before_filter :require_user, :except => [:show]
  
  # GET /documents
  # GET /documents.xml
  def index
    @documents = Document.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml # index.xml.builder
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @banner_size = 'large'
    @document = Document.find(params[:id])
    @documents = Document.brochures
    respond_to do |format|
      format.html # { render :layout => "issuu"}
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = Document.new
    @document_types = DocumentType.all
    @document.assets.build
    @document.coverflows.build
    respond_to do |format|
      format.html { render :layout => "admin"}
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
    @document_types = DocumentType.all
    if @document.assets.blank?
      @document.assets.build
    end
    if @document.coverflows.blank?
      @document.coverflows.build
    end
    respond_to do |format|
      format.html { render :layout => "admin"}
    end
  end

  # POST /documents
  # POST /documents.xml
  def create
    @document = Document.new(params[:document])
    @document_types = DocumentType.all
    respond_to do |format|
      if @document.save
        flash[:notice] = 'Document was successfully created.'
        format.html { redirect_to(@document) }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.xml
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        flash[:notice] = 'Document was successfully updated.'
        format.html { redirect_to(@document) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml  { head :ok }
    end
  end
end
