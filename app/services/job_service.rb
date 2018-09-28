class JobService
  def self.get_jobs
    new.get_jobs_by_city
  end

  def get_jobs_by_city
    @cities.each do |city|
      CityService.jobs(city)
    end
  end

  private

  def initialize
    @cities = City.all
  end
end
