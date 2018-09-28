class CitiesController < ApplicationController
  def index
    # @cities = City.all
    @presenter = JobFormatPresenter.new(City.all)
  end
end
