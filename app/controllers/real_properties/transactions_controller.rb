module RealProperties
  class TransactionsController < ApplicationController
    def index
      @real_property = RealProperty.find(params[:real_property_id])
    end
  end
end
