class JobService
  def self.get_jobs
    new.get_jobs
  end

  def get_jobs
    @cities.each do |city|
      JobRequest.jobs_by_city(city.name)
    end
  end

  private

  def initialize
    @cities = City.all
  end
end
