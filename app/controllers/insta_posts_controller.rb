class InstaPostsController < ApplicationController
  require 'csv'
  before_action :set_insta_post, only: %i[ show edit update destroy ]
  def import
    file = params['file']
    if file
     redirect_to root_path, notice: 'Only CSV, please!' unless file.content_type =='text/csv'
     file = File.open(file)
     csv=CSV.parse(file, headers: :true)
     csv.each do |row|
      insta_post_hash={}
      insta_post_hash[:id_media]=row['id']
      insta_post_hash[:like_count]=row['like_count']
      insta_post_hash[:media_type]=row['media_type']
      insta_post_hash[:comments_count]=row['comments_count']
      insta_post_hash[:timestamp]=row['timestamp']
      insta_post_hash[:media_url]=row['media_url']
      InstaPost.create(insta_post_hash)
     end
     redirect_to insta_posts_path
     #binding.b
    end
  end
  # GET /insta_posts or /insta_posts.json
  def index
    date_start=params[:date_start]
    date_end=params[:date_end]

    if date_start && date_end
        @insta_posts = InstaPost.where(timestamp: (Date.parse(date_start)..Date.parse(date_end)))
        render json: @insta_posts
    else
      @insta_posts= InstaPost.all.limit(10)
      render json: @insta_posts

    end
  end

  # GET /insta_posts/1 or /insta_posts/1.json
  def show
  end

  # GET /insta_posts/new
  def new
    @insta_post = InstaPost.new
  end

  # GET /insta_posts/1/edit
  def edit
  end

  # POST /insta_posts or /insta_posts.json
  def create
    @insta_post = InstaPost.new(insta_post_params)

    respond_to do |format|
      if @insta_post.save
        format.html { redirect_to insta_post_url(@insta_post), notice: "Insta post was successfully created." }
        format.json { render :show, status: :created, location: @insta_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insta_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insta_posts/1 or /insta_posts/1.json
  def update
    respond_to do |format|
      if @insta_post.update(insta_post_params)
        format.html { redirect_to insta_post_url(@insta_post), notice: "Insta post was successfully updated." }
        format.json { render :show, status: :ok, location: @insta_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insta_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insta_posts/1 or /insta_posts/1.json
  def destroy
    @insta_post.destroy

    respond_to do |format|
      format.html { redirect_to insta_posts_url, notice: "Insta post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insta_post
      @insta_post = InstaPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insta_post_params
      params.require(:insta_post).permit(:like_count, :media_type, :media_url, :timestamp, :comments_count, :id_media, :impressions, :reach)
    end
end
