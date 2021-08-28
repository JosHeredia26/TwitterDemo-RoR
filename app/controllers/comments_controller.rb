class CommentsController < ApplicationController
  # GET /comments

  # GET /comments/:id

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
    tweet = Tweet.find(params[:tweet_id])
    comment = Comment.new(body: params[:body], user: current_user,
                          tweet: Tweet.find(params[:tweet_id]))
    comment.save
    redirect_to tweet
  end

  # PATCH/PUT /comments/:id
  def update
    @comment = Comment.find(params[:id])
    @comment.user = current_user

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

  # Only allow a list of trusted parameters through.
  # def comment_params
  #   params.require(:comment).permit(:body)
  # end
end
