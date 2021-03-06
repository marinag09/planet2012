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
    @comment.user_id = current_user.id

    respond_to do |format|
    if @comment.save
       format.html { redirect_to @site, notice: 'Comentario creado' }
       format.json { head :no_content }
    else
       format.html { render action: "edit" }
       format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
   end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
@site = Site.find(params[:site_id])
@comment = @site.comments.find(params[:id])

respond_to do |format|
if @comment.update_attributes(params[:comment])
format.html { redirect_to @site, notice: 'Comentario actualizado' }
format.json { head :no_content }
else
format.html { render action: "edit" }
format.json { render json: @comment.errors, status: :unprocessable_entity }
end
end
end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @site = Site.find(params[:site_id])
    @coment = @site.comments.find(params[:id])
    @coment.destroy

   respond_to do |format|
      format.html { redirect_to site_path(@site) }
      format.json { head :no_content }
    end
  end
end
