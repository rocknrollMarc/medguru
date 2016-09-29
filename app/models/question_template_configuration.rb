class QuestionTemplateConfiguration
  def names
    templates.map { |x| [x[:name], x[:layout]] }
  end

  def config(name)
    templates.each { |x| return x if x[:layout] == name }
  end

  def templates
    @templates ||= template_array
  end


  def build_question template
    if(template == 'standard')
      return build_standard
    elsif template == 'text'
      return build_text
    elsif template == 'figures'
      return build_figures
    elsif template == 'instill'
      build_instill
    elsif template == 'intent'
build_intent
    end
  end

  def build_standard
    conf = config('standard')
    question = Question.new
    conf[:answers].times { |_x| question.answers.build }
    question
  end

  def build_figures
    question = Question.new
    question.has_image = true
    question.has_perspective = true
    ['l', 'r', 'h', 'o', 'u'].each {|x| question.answers.build(body: "#{x}")}
    question
  end

  def build_intent
    question = Question.new
    question.has_downloadable = true
    question
  end

  def build_instill
    question = Question.new
    question.has_image = true
    question.has_perspective = true
    ['A', 'B', 'C', 'D', 'E'].each {|x| question.answers.build(body: "#{x}")}
    question
  end

  def build_text
    conf = config('text')
    question = Question.new
    question.meta_question = true
    conf[:questions].times { |_x| question.questions.build(subquestion: true) }
    questions = question.questions
    for q in questions
      conf[:answers].times { |_x| q.answers.build }
    end
    question
  end

  def template_array
    [{
      name: 'Standard',
      layout: 'standard',
      subquestion: false,
      meta_question: false,
      answers: 5,
      questions: 0,
      downloadable: false,
      perspective: false,
      extra_image: false
    },
     {
       name: 'Textverständnis',
       layout: 'text',
       subquestion: true,
       meta_question: true,
       answers: 5,
       questions: 4,
       downloadable: false,
       perspective: false,
       extra_image: false
     },
     {
       name: 'Musterzuordnen',
       layout: 'pattern',
       subquestion: false,
       meta_question: false,
       answers: 5,
       questions: 0,
       downloadable: false,
       perspective: false,
       extra_image: true
     },
     {
       name: 'Schlauchfiguren',
       layout: 'figures',
       subquestion: false,
       meta_question: false,
       answers: 0,
       questions: 0,
       downloadable: false,
       perspective: true,
       extra_image: true
     },
     {
       name: 'Konzentriertes sorgfältiges Arbeiten',
       layout: 'intent',
       subquestion: false,
       meta_question: false,
       answers: 0,
       questions: 0,
       downloadable: true,
       perspective: false,
       extra_image: false
     },
     {
       name: 'Figuren Lernen Einprägphase',
       layout: 'instill',
       subquestion: true,
       meta_question: true,
       answers: 5,
       questions: 16,
       downloadable: true,
       perspective: false,
       extra_image: true
     }]
  end
end
