class JobFormatPresenter < DelegatePresenter::Base
  attr_reader :cities

  def initialize(in_cities)
    @in_cities = in_cities
    @cities = percentage
  end

  def percentage
    @in_cities.map do |city|
      CalcPercentPresenter.new(city)
    end
  end
end
