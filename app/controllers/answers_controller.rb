class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update]
  before_action :set_question, only: [:edit, :update]
  before_action :set_exam, only: [:edit, :update]

  def new
    @exam = Exam.find(params[:exam_id])
    @question = Question.find(params[:question_id])

    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]

    if @answer.save
      redirect_to new_exam_question_path(params[:exam_id])
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      redirect_to new_exam_question_path(params[:exam_id])
    else
      render 'edit'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end
end
