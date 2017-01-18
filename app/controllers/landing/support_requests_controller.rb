class Landing::SupportRequestsController < Landing::LandingController
  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = SupportRequest.new(support_request_params)

    if @support_request.save
      redirect_to contact_path, notice: 'Запрос отправлен успешно!'
    else
      render :new
    end
  end

  private

  def support_request_params
    params.require(:support_request).permit(:name, :email, :content)
  end
end
