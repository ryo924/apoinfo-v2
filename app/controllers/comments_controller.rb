class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to appointment_path(@comment.appointment)
    else
      @appointment = @comment.appointment
      @comments = @appointment.comments
      render "appointments/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, appointment_id: params[:appointment_id])
  end

end
