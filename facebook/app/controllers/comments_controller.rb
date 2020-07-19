class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
 # def index
 #   @comments = Comment.all.order("created_at DESC")
 #   @comment = comment.new
 # end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

    # GET /comments/new
  def new
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # COMMENT /comments
  # COMMENT /comments.json
  def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to request.referrer }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment).permit(:comment, :likes)
    end
end
