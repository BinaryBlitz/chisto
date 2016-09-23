class Admin::WashingsController < ApplicationController
  before_action :set_washing, only: [:show, :edit, :update, :destroy]

  def index
    @washings = Washing.all
  end

  def show
  end

  def new
    @washing = Washing.new
  end

  def create
    @washing = Washing.new(washing_params)

    if @washing.save
      redirect_to admin_washings_url, notice: 'Химчистка была успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @washing.update(washing_params)
      redirect_to admin_washings_url, notice: 'Химчистка успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @washing.destroy
    redirect_to admin_washings_url, notice: 'Химчистка была успешно удалена.'
  end

  private

  def set_washing
    @washing = Washing.find(params[:id])
  end

  def washing_params
    params.require(:washing).permit(:name, :description, :category, :logo, :image)
  end
end
