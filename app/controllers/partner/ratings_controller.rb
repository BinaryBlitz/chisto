class Partner::RatingsController < Partner::PartnerController
  def index
    @ratings = current_laundry.ratings.verified.with_content
  end
end
