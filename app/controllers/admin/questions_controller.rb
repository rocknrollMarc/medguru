class Admin::QuestionsController < Admin::AdminController
  def index
    @questions = Question.where(subquestion: false).page(params[:page]).per(params[:per])
  end

  def new
    answers_count = paramValueToInt(params[:answers])
    @question = Question.new

    questions = [@question]

    if params[:meta].present?
      questions_count = paramValueToInt(params[:questions])
      @question.meta_question = true
      questions_count.times { |_x| @question.questions.build(subquestion: true) }
      puts questions_count
      questions = @question.questions
    end
    for question in questions
      answers_count.times { |_x| question.answers.build }
      puts answers_count
    end
    puts @question.questions.to_json
  end

  def show
  end

  def create
    @question = Question.new(question_params)
    puts @question.to_json
    puts @question.questions.to_json
    if @question.save
      redirect_to admin_question_path(@question)
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:intern_name, :body, :difficulty, :subquestion, :meta_question, :category_id, answers_attributes: [:id, :body, :correct_answer, :_destroy], questions_attributes: [:body, :difficulty, :meta_question, :subquestion, answers_attributes: [:id, :body, :correct_answer, :_destroy]])
  end

  def paramValueToInt(value)
    value.to_i
  rescue
    0
  end
end
