class Admin::TreatmentsController < Admin::AdminController
  before_action :set_item, only: %i[index new create]
  before_action :set_treatment, only: %i[edit update destroy]

  def index
    @treatments = @item.treatments
  end

  def new
    @treatment = @item.treatments.build
  end

  def create
    @treatment = @item.treatments.build(treatment_params)

    if @treatment.save
      redirect_to admin_item_treatments_path(@treatment.item), notice: 'Услуга успешно создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @treatment.update(treatment_params)
      redirect_to admin_item_treatments_path(@treatment.item), notice: 'Услуга успешно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @treatment.destroy
    redirect_to admin_item_treatments_path(@treatment.item), notice: 'Услуга успешно удалена'
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:name, :description)
  end
end
