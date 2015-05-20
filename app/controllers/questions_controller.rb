class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update]
  before_action :set_exam, only: [:edit, :update]

  def new
    @exam = Exam.find(params[:exam_id])

    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.exam_id = params[:exam_id]

    if @question.save
      redirect_to new_exam_question_answer_path(params[:exam_id], @question)
    else
      render 'new'
    end

  end

  def edit

  end

  def update

  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
