class Partner::LaundryTreatmentsController < Partner::PartnerController
  before_action :set_treatment, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_laundry_treatment, only: [:edit, :update, :destroy]

  def new
    @laundry_treatment = @treatment.laundry_treatments.build
  end

  def create
    @laundry_treatment = @treatment.laundry_treatments.build(laundry_treatment_params)
    @laundry_treatment.laundry = current_laundry

    if @laundry_treatment.save
      redirect_to partner_treatments_path, notice: 'Услуга успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @laundry_treatment.update(laundry_treatment_params)
      redirect_to partner_treatments_path, notice: 'Услуга успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @laundry_treatment.destroy
    redirect_to partner_treatments_path, notice: 'Услуга успешно удалена'
  end

  private

  def set_treatment
    @treatment = Treatment.find(params[:treatment_id])
  end

  def set_laundry_treatment
    @laundry_treatment = current_laundry.laundry_treatments.find_by!(treatment: @treatment)
  end

  def laundry_treatment_params
    params.require(:laundry_treatment).permit(:price)
  end
end
