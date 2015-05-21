class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show]
  before_action :require_same_user_or_admin, only: [:edit, :update]

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
      flash[:notice] = "Exam created"
      redirect_to new_exam_question_path(@exam)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @exam.update(exam_params)
      flash[:notice] = "Exam was updated successfully"
      redirect_to new_exam_question_path(@exam)
    else
      render 'edit'
    end
  end

  def vote
  @vote = Vote.create(voteable: @exam, creator: current_user, vote: params[:vote])

  respond_to do |format|
    format.html do
      redirect_to :back
    end
    format.js
  end
end

  private

  def exam_params
    params.require(:exam).permit(:name, :doc_url, category_ids:[])
  end

  def set_exam
    @exam = Exam.find_by(slug: params[:id])
  end

  def require_same_user_or_admin
    unless logged_in? && (current_user == @exam.creator || current_user.admin?)
      no_access
    end
  end
end
