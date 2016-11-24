class Landing::PartnerApplicationsController < Landing::LandingController
  def new
    @partner_application = PartnerApplication.new
  end

  def create
    @partner_application = PartnerApplication.new(partner_application_params)

    if @partner_application.save
      redirect_to partner_path, notice: 'Заявка отправлена успешно!'
    else
      render :new
    end
  end

  private

  def partner_application_params
    params
      .require(:partner_application)
      .permit(:representative_name, :laundry_name, :city, :phone_number, :email, :content)
  end
end
