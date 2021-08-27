class CommentsController < ApplicationController
  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/:id
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/:id/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  # PATCH/PUT /comments/:id
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  # DELETE /comments/:id
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
