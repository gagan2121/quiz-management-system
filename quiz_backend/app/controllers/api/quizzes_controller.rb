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

  private

  def quiz_params
    prams.require(:quiz).permit(:title)
  end
end
