class CommentsController < ApplicationController
  
  # GET /comments
  # GET /comments.json
  def index
    if params[:site_id].nil? or params[:site_id].empty?
    @comments = Comment.all
    else 
    @comments = Site.find(params[:site_id]).comments # path: /sites/id/comment
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  def edit
   @site = Site.find(params[:site_id])
   @comment = @site.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @site = Site.find(params[:site_id])
    @comment = @site.comments.create(params[:comment])

    redirect_to site_path(@site)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
     @site = Site.find(params[:site_id])
     @comment = Comment.find(params[:id])

    redirect_to site_path(@site)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @site = Site.find(params[:site_id])
    @coment = @site.comments.find(params[:id])
    @coment.destroy

    redirect_to site_path(@site)
  end
end
