class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
   @node = Node.find_by_number(params[:node_id])
   @board = @node.board
   @comment = @node.comments.create(params[:comment])
   @comment.formated_date = @comment.created_at.strftime("%d %b %Y, %H:%M")
   @comment.number = @board.post_counter.to_int + 1
   @comment.save
   @node.last_comment = @comment.created_at # update last_comment field in nodes table
   @node.save
   @board.post_counter = @comment.number
   @board.save
   redirect_to node_path(@node) 
  
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @node = Node.find_by_number(params[:node_id])
    @comment = @node.comments.find(params[:id])
    @comment.destroy
    redirect_to node_path(@node)
  end
end
