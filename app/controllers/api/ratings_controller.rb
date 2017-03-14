class API::RatingsController < API::APIController
  skip_before_action :restrict_access!, only: [:index]
  before_action :set_laundry, only: [:index, :create]
  before_action :set_rating, only: [:update]

  def index
    @ratings = @laundry.ratings.verified
  end

  def create
    @rating = @laundry.ratings.build(rating_params.merge(user: current_user))

    if @rating.save
      render :show, status: :created
    else
      render json: @rating.errors, status: 422
    end
  end

  def update
    if @rating.update(rating_params)
      head :ok
    else
      render json: @rating.errors, status: 422
    end
  end

  private

  def set_laundry
    @laundry = Laundry.find(params[:laundry_id])
  end

  def set_rating
    @rating = current_user.ratings.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:value, :content)
  end
end
