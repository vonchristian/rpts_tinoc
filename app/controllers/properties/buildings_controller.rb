module Properties
  class BuildingsController < ApplicationController
    def index
      @buildings = RealProperties::PropertyTypes::Building.all
    end
  end
end
