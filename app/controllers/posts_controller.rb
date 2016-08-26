class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :set_goomp, only: [:new]
  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  def show
    render layout: 'pages'
  end

  def like
    @post.liked_by current_user
    @post.reload
  end

  # GET /posts/new
  def new
    @post = Post.new
    render layout: "pages"
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    @post.goomp = Goomp.friendly.find params[:goomp_id] if params[:goomp_id].present?

    respond_to do |format|
      if @post.save
        format.html do
          # It's a full-size story
          if @post.content
            @post.generate_link_for_story!
            redirect_to @post.goomp, notice: 'Post was successfully created.'
          else
            redirect_back fallback_location: @post.goomp, notice: 'Post was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_goomp
      @goomp = Goomp.friendly.find(params[:goomp_id]) if params[:goomp_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(
        :title,
        :body,
        :content,
        :goomp_id,
        :subtopic_id,
        :link_title,
        :link_description,
        :link_image,
        :link_url,
      )
    end
end
