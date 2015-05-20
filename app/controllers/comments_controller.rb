class CommentsController < ApplicationController
  def create
    @exam = Exam.find(params[:exam_id])
    @comment = Comment.new

    if @comment.save
      redirect_to exams_path(@exam)
    else
      render "exams/show"
    end
  end
  
end
