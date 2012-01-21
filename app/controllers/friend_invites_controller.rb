class FriendInvitesController < ApplicationController
  
  before_filter :require_user, :only => [:index, :update, :edit, :show]
  
  # GET /friend_invites
  # GET /friend_invites.xml
  def index
    @friend_invites = FriendInvite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friend_invites }
    end
  end

  # GET /friend_invites/1
  # GET /friend_invites/1.xml
  def show
    @friend_invite = FriendInvite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend_invite }
    end
  end

  # GET /friend_invites/new
  # GET /friend_invites/new.xml
  def new
    @friend_invite = FriendInvite.new

    respond_to do |format|
      format.html {redirect_to invite_thank_you_path}
      format.xml  { render :xml => @friend_invite }
    end
  end

  # GET /friend_invites/1/edit
  def edit
    @friend_invite = FriendInvite.find(params[:id])
  end

  # POST /friend_invites
  # POST /friend_invites.xml
  def create
    @friend_invite = FriendInvite.new(params[:friend_invite])

    respond_to do |format|
      if @friend_invite.save
        invite = ApplicationMailer.create_invite_mailer(params)
        invite.set_content_type("text/html")
        ApplicationMailer.deliver(invite)
        format.html { redirect_to(invite_thank_you_path, :notice => 'Your invitation has been sent.') }
      else
        format.html { redirect_to invite_friend_path }
      end
    end
  end

  # PUT /friend_invites/1
  # PUT /friend_invites/1.xml
  def update
    @friend_invite = FriendInvite.find(params[:id])

    respond_to do |format|
      if @friend_invite.update_attributes(params[:friend_invite])
        format.html { redirect_to(@friend_invite, :notice => 'FriendInvite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend_invite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_invites/1
  # DELETE /friend_invites/1.xml
  def destroy
    @friend_invite = FriendInvite.find(params[:id])
    @friend_invite.destroy

    respond_to do |format|
      format.html { redirect_to(friend_invites_url) }
      format.xml  { head :ok }
    end
  end
end
