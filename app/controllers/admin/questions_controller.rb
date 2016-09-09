class Admin::QuestionsController < Admin::AdminController
  def index
    @questions = Question.page(params[:page]).per(params[:per])
  end

  def new
  end

  def show
  end
end
