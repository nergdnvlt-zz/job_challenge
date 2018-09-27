class LanguageService
  def self.jobs_by_language(city)
    new(city).get_jobs
  end

  def get_jobs
    @languages.each do |language|
      jobs_by_language = JobRequest.jobs(@city.name, language.name)
      jobs_by_language.each do |job|
        JobEvaluator.create_job(language, job)
      end
    end
  end

  def initialize(city)
    @city = city
    @languages = @city.languages
  end
end
