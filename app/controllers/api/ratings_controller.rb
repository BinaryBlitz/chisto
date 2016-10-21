class API::RatingsController < API::APIController
  before_action :set_laundry, only: [:create]

  def create
    @rating = @laundry.ratings.build(rating_params.merge(user: current_user))

    if @rating.save
      render :show, status: :created
    else
      render json: @rating.errors, status: 422
    end
  end

  private

  def set_laundry
    @laundry = Laundry.find(params[:laundry_id])
  end

  def rating_params
    params.require(:rating).permit(:value, :content)
  end
end