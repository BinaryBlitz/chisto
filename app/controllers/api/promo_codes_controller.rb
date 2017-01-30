class API::PromoCodesController < API::APIController
  skip_before_action :restrict_access!, only: [:show]
  before_action :set_promo_code, only: [:show]

  def show
  end

  private

  def set_promo_code
    @promo_code = PromoCode.active
      .or(PromoCode.indefinite)
      .unredeemed
      .find_by!(code: params[:code])
  end
end
