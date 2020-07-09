class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index    
    @friendships = Friendship.all.order("created_at DESC")    
    @friendship = Friendship.new
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = current_user.friendships.build
  end

  # GET /friendships/1/edit
  def edit
  end

  # FRIENDSHIP /friendships
  # FRIENDSHIP /friendships.json
  def create
    @notification = Notification.find(params['notification_id']) 
    friend_id =  @notification.friendship_id
    @friendship = current_user.friendships.build(:friend_id => friend_id)    
    if @friendship.save
      @notification.notice = 1;
      @notification.friendship_id = @friendship.id 
      @notification.save

      #save mutual friendship
      Friendship.new(user_id: friend_id, friend_id: current_user.id).save

      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship_mutual = Friendship.where(:user_id => @friendship.friend_id).first
    @friendship.destroy    
    @friendship_mutual.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.fetch(:friendship).permit(:user_id, :friend_id)
    end
end
