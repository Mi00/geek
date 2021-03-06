class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]

 
  def create
    @table = Table.find(params[:table_id])
    @comment = @table.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @table, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @table = @comment.table_id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to table_path(@table), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:table_id, :body, :user_id)
    end
end
