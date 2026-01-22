class Api::QuizzesController < Api::BaseController
  def index
    render json: Quiz.all
  end

  def show 
    quiz = Quiz.includes(questions: :options).find(params[:id])
    render json: quiz.as_json(include: {
      questions: {include: :options}
    })
  end

  def create
    quiz = Quiz.create!(quiz_params)
    render json: quiz
  end

  def submit
    quiz = Quiz.includes(questions: :options).find(params[:id])
    score = 0

    params[:answers].each do |ans|
      question = quiz.questions.find(ans[:question_id])
      correct_option = question.options.find_by(is_correct: true)

      if correct_option.id == ans[:option_id]
        score +=1
      end

      Answer.create!(
        question_id: question.id,
        select_option_id: ans[:option_id]
      )

    end
    Result.create!(
      quiz_id: quiz.id,
      score: score
    )

    render json: {
      score: score,
      total: quiz.questions.count
    }
  end

  private

  def quiz_params
    prams.require(:quiz).permit(:title)
  end
end
