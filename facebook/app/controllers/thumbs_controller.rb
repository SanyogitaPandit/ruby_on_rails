class ThumbsController < ApplicationController
    def index
      @post = Post.find(params[:post_id])
      @post_thumbs = @post.thumbs.order("created_at DESC")
    end

    def new
        @post = Post.find(params[:post_id])
        @post_thumb = @post.thumbs.build
    end

    def create
        @post = Post.find(params[:post_id])
        @post_thumb = @post.thumbs.build(user_id: current_user.id)    
        @post_thumb.save
        
        respond_to do |format|                    
          format.html { redirect_to root_url }
          format.json { head :no_content }
        end     
    end

    def destroy
      @thumb = Thumb.find(params[:id])
      @thumb.destroy
      respond_to do |format|
        format.html { redirect_to root_url }
        format.json { head :no_content }
      end
    end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_thumb
      @thumb = Thumb.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment).permit()
    end    
end