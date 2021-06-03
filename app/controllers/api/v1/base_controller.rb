class Api::V1::BaseController < ActionController::API
  def index
    @rooms = Room.all
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.room_id = params[:room_id]
    @survey.author_id = params[:author_id]
    if @survey.save
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :ok
    end
  end

  def display_results
    @surveys = Survey.where(author_id: 1)
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition)
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
