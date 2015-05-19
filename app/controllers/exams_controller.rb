class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update]

  def show

  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to exam_path(@exam)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @exam.update(exam_params)
      redirect_to exam_path(@exam)
    else
      render 'edit'
    end
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :doc_url, category_ids:[])
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end
