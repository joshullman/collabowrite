class CommentsController < ApplicationController
  
  def create
    if params[:script_id]
      @script = Script.find(params[:script_id])
      @comment = @script.comments.new(comment_params)
    else
      @group = Group.find(params[:group_id])
      @comment = @group.comments.new(comment_params)
    end
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        if params[:script_id]
          format.html { redirect_to @script, notice: 'Comment was successfully created.' }
        else
          format.html { redirect_to @group, notice: 'Comment was successfully created.' }
        end
      else
        if params[:script_id]
          format.html { redirect_to @script, notice: 'Comment did not save for some mysterious reason.' }
        else
          format.html { redirect_to @group, notice: 'Comment did not save for some mysterious reason.' }
        end
      end
    end
  end

  def destroy
    p params
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      if params[:script_id]
        format.html { redirect_to script_path(params[:script_id]), notice: 'Comment was successfully destroyed.' }
      else
        format.html { redirect_to group_path(params[:group_id]), notice: 'Comment was successfully destroyed.' }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :commentable, :content)
    end
end
