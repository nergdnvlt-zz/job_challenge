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

class CityService
  def self.jobs(city)
    new(city).build_jobs
  end

  def build_jobs
    JobEvaluator.create_jobs(@city, request_jobs)
  end

  def request_jobs
    JobRequest.jobs(@city.name)
  end

  def initialize(city)
    @city = city
  end
end
