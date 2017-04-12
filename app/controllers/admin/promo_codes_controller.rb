class Admin::PromoCodesController < Admin::AdminController
  def index
    @promo_codes = PromoCode.general
  end

  def new
    @promo_code = PromoCode.new
  end

  def create
    @promo_code = PromoCode.new(promo_code_params)

    if @promo_code.save
      redirect_to admin_promo_codes_path, notice: 'Промокод успешно создан'
    else
      render :new
    end
  end

  private

  def promo_code_params
    params
      .require(:promo_code)
      .permit(:code, :discount, :reusable, :valid_from, :valid_until, :first_time_only)
  end
end
