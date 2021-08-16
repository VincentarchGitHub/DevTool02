class PostsController < ApplicationController
  #before_action :set_project, except: [:index, :show, :edit, :update, :destroy]
  before_action :set_post, only: %i[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_admin!, except: [:index, :show]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.order('created_at DESC')
    
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    views = @post.views + 1
    @post.update(views: views)
    @comments = @post.comments.order('created_at DESC')

    @num_comments = @post.comments.count
    @post.comments.each do |comment|
      @num_comments += comment.comments.count
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @project_id = params[:project_id]
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @element = @post.elements.build
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)


    respond_to do |format|
      if @post.save
        format.html { redirect_to edit_post_path(@post) }
        format.json { render :edit, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.find(params[:id])
    @element = @post.elements.build
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to  @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to project_path, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    #def set_project
    #  @project = Projecst.friendly.find(params[:project_id])
    #end    
    
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :work_stage, :description, :header_image, :project_id)
    end
  
end
