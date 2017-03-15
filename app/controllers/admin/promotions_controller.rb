class Admin::PromotionsController < Admin::AdminController
  before_action :set_promotion, only: [:show]

  def index
    @promotions = Promotion.all
  end

  def show
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      redirect_to admin_promotions_path, notice: 'Промокоды успешно созданы'
    else
      render :new
    end
  end

  private

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def promotion_params
    params
      .require(:promotion)
      .permit(
        :name, :description, :promo_codes_count,
        :valid_from, :valid_until, :discount, :first_time_only
      )
  end
end
