class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update]

  def show
    @comment = Comment.new
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    @exam.creator = current_user

    if @exam.save
      redirect_to new_exam_question_path(@exam)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @exam.update(exam_params)
      redirect_to new_exam_question_path(@exam)
    else
      render 'edit'
    end
  end

  def vote

  end

  private

  def exam_params
    params.require(:exam).permit(:name, :doc_url, category_ids:[])
  end

  def set_exam
    @exam = Exam.find_by(slug: params[:id])
  end
end
