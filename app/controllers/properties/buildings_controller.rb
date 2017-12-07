module Properties
  class BuildingsController < ApplicationController
    def index
      @buildings = RealProperties::Building.all
    end
  end
end
