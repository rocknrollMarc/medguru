class Admin::QuestionsController < Admin::AdminController

  before_action :find_question, only: [:edit, :show, :update]

  def index
    @questions = Question.where(subquestion: false).page(params[:page]).per(params[:per])
  end

  def new
    category_id = paramValueToInt(params[:category_id])
    @category = Category.find(category_id)
    qtc = QuestionTemplateConfiguration.new
    template = qtc.config('standard')
    if @category.template.present?
      _templ = qtc.config(@category.template)
      puts _templ
      template = _templ if _templ.present?
    end
    @question = qtc.build_question(template[:layout])
    @question.category_id = @category.id
  end

  def edit
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


  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question)
    else
      render 'edit'
    end
  end

  private


  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:intern_name,
                                     :body,
                                     :difficulty,
                                     :subquestion,
                                     :meta_question,
                                     :category_id,
                                     :reference_image,
                                     :has_image,
                                     :perspective_image,
                                     :has_perspective,
                                     :downloadable,
                                     :has_downloadable,
                                     :solution,
                                     :has_solution,
                                     :source,
                                     :has_source,                                     
                                     answers_attributes: [:id, :body, :correct_answer, :_destroy], questions_attributes: [:id, :body, :difficulty, :meta_question, :subquestion, answers_attributes: [:id, :body, :correct_answer, :_destroy]])
  end

  def paramValueToInt(value)
    value.to_i
  rescue
    0
  end
end
