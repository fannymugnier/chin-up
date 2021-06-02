class Api::V1::BaseController < ActionController::API
  def test
    render  json: { hello: "world" },
            status: :ok
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.room_id = Room.first.id
    if @survey.save
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :ok
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition)
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
