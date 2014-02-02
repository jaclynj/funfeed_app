class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1.json
  def show
    render json: @post
  end

  # POST /posts.json
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    end
  end

  # PUT /posts/1.json
  def update
    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1.json
  def destroy
    @post.destroy
      head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :media_type)
    end
end
