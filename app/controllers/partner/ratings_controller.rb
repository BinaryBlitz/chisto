class Partner::RatingsController < Partner::PartnerController
  def index
    @ratings = Rating.verified.with_content
  end
end
