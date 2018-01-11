module Settings
  class AdjustmentFactorsController < ApplicationController
    def new
      @adjustment_factor = Configurations::AdjustmentFactor.new
    end
    def create
      @adjustment_factor = Configurations::AdjustmentFactor.create(adjustment_factor_params)
      if @adjustment_factor.valid?
        @adjustment_factor.save
        redirect_to settings_url, notice: "AdjustmentFactor created successfully."
      else
        render :new
      end
    end

    private
    def adjustment_factor_params
      params.require(:configurations_adjustment_factor).permit(:percent, :name)
    end
  end
end
