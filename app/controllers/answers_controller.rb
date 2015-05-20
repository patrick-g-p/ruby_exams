class AnswersController < ApplicationController
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

  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
