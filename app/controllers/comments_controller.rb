class CommentsController < ApplicationController
  def create
    @exam = Exam.find_by(slug: params[:exam_id])
    @comment = @exam.comments.new(params.require(:comment).permit(:body))
    @comment.creator = current_user

    if @comment.save
      redirect_to exam_path(@exam)
    else
      render "exams/show"
    end
  end

  def vote

  end

end
