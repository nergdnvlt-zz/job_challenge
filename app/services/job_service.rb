class JobService
  def self.get_jobs
    new.get_jobs
  end

  def get_jobs
    @cities.each do |city|
      jobs = JobRequest.jobs_by_city(city.name)
      jobs.each do |job|
        JobEvaluator.create_job(job)
      end
    end
  end

  private

  def initialize
    @cities = City.all
  end
end
