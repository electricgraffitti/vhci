class NewsletterSubscriptionsController < ApplicationController
  
  before_filter :require_user, :except => [:new, :create]
  
  # GET /newsletter_subscriptions
  # GET /newsletter_subscriptions.xml
  def index
    @newsletter_subscriptions = NewsletterSubscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @newsletter_subscriptions }
    end
  end

  # GET /newsletter_subscriptions/1
  # GET /newsletter_subscriptions/1.xml
  def show
    @newsletter_subscription = NewsletterSubscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @newsletter_subscription }
    end
  end

  # GET /newsletter_subscriptions/new
  # GET /newsletter_subscriptions/new.xml
  def new
    @newsletter_subscription = NewsletterSubscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter_subscription }
    end
  end

  # GET /newsletter_subscriptions/1/edit
  def edit
    @newsletter_subscription = NewsletterSubscription.find(params[:id])
  end

  # POST /newsletter_subscriptions
  # POST /newsletter_subscriptions.xml
  def create
    @newsletter_subscription = NewsletterSubscription.new(params[:newsletter_subscription])

    respond_to do |format|
      if @newsletter_subscription.save
        flash[:notice] = 'NewsletterSubscription was successfully created.'
        format.html { redirect_to request.env["HTTP_REFERER"] }
        format.xml  { render :xml => @newsletter_subscription, :status => :created, :location => @newsletter_subscription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletter_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsletter_subscriptions/1
  # PUT /newsletter_subscriptions/1.xml
  def update
    @newsletter_subscription = NewsletterSubscription.find(params[:id])

    respond_to do |format|
      if @newsletter_subscription.update_attributes(params[:newsletter_subscription])
        flash[:notice] = 'NewsletterSubscription was successfully updated.'
        format.html { redirect_to newsletter_subscriptions_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_subscriptions/1
  # DELETE /newsletter_subscriptions/1.xml
  def destroy
    @newsletter_subscription = NewsletterSubscription.find(params[:id])
    @newsletter_subscription.destroy

    respond_to do |format|
      format.html { redirect_to(newsletter_subscriptions_url) }
      format.xml  { head :ok }
    end
  end
end
