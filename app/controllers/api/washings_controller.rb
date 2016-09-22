class API::WashingsController < API::APIController
  def index
    @washings = Washing.all
  end

  def show
    @washing = Washing.find(params[:id])
  end
end
