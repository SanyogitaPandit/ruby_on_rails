class UsersController < ApplicationController
  
    def show
      @user = User.find(params[:id])
      @posts = @user.posts.all
      @comment = current_user.comments.build
      @like = current_user.thumbs.build
      set_image
    end
  
    def update
      @user = User.find(params[:id])
      @user.avatar.attach(params[:user][:avatar])
      #reload page
      redirect_back(fallback_location: user_path(current_user))
    end
  
    def index
      @users = User.all
    end
  
    private
      def set_image
        if @user.avatar.attachment
          @image = @user.avatar
        end
      end
  end