class CityService
  def self.jobs(city)
    new(city).build_jobs
  end

  def build_jobs
    JobEvaluator.create_jobs(@city, request_jobs)
  end

  private

  def request_jobs
    JobRequest.jobs(@city.name)
  end

  def initialize(city)
    @city = city
  end
end
