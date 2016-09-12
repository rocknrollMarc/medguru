class Admin::QuestionsController < Admin::AdminController
  def index
    @questions = Question.page(params[:page]).per(params[:per])
  end

  def new
    @question= Question.new
  end

  def show
  end

  def create
    @question= Question.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render 'new'
    end
  end


private

  def question_params
    params.require(:question).permit(:intern_name ,:body, :difficulty, :answers_attributes => [:id, :body, :correct_answer,  :_destroy])
  end
end
