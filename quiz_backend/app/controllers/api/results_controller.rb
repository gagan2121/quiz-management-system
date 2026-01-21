class Api::ResultsController < Api::BaseController
  def create
    result = Result.create!(
      quiz_id: params[:quiz_id],
      score: params[:score]
    )
    render json: result
  end
end
