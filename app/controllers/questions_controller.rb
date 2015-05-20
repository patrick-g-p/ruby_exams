class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update]
  before_action :set_exam

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.exam_id = @exam.id

    if @question.save
      redirect_to new_exam_question_answer_path(@exam, @question)
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to new_exam_question_path(@exam)
    else
      render 'edit'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_exam
    @exam = Exam.find_by(slug: params[:exam_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
