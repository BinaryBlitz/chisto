class Admin::RatingsController < Admin::AdminController
  before_action :set_rating, only: %i[update destroy]

  def index
    @ratings = Rating.unverified.with_content
  end

  def update
    if @rating.update(rating_params)
      redirect_to admin_ratings_path, notice: 'Отзыв успешно одобрен'
    else
      redirect_to :back
    end
  end

  def destroy
    @rating.destroy
    redirect_to admin_ratings_url, notice: 'Отзыв успешно удалён'
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:verified)
  end
end
