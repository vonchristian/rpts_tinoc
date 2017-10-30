class TaxpayersController < ApplicationController
  def index
    @taxpayers = Taxpayer.all
  end
  def new
    @taxpayer = Taxpayer.new
  end
  def create
    @taxpayer = Taxpayer.create(taxpayer_params)
    if @taxpayer.valid?
      @taxpayer.save
      redirect_to taxpayer_url(@taxpayer), notice: "Taxpayer saved successfully"
    else
      render :new
    end
  end
  def show
    @taxpayer = Taxpayer.find(params[:id])
  end

  private
  def taxpayer_params
    params.require(:taxpayer).permit(:first_name, :middle_name, :last_name, :contact_number, :email)
  end
end
