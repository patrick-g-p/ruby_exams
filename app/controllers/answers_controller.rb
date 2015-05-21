class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update]
  before_action :set_question
  before_action :set_exam
  before_action :require_user

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id

    if @answer.save
      flash[:notice] = "Answer was linked to your question"
      redirect_to new_exam_question_path(@exam)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      flash[:notice] = "Answer was updated"
      redirect_to new_exam_question_path(@exam)
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
    @exam = Exam.find_by(slug: params[:exam_id])
  end
end
