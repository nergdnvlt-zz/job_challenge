class JobEvaluator
  def self.create_jobs(city, raw_jobs)
    new(city, raw_jobs).build_jobs
  end

  def build_jobs
    @raw_jobs.each do |job|
      lang = find_language(job[:description])
      Job.create!(
        city: @city,
        title: job[:title],
        job_type: job[:type],
        language: lang
      )
    end
    return @city.jobs.all
  end

  private

  def initialize(city, raw_jobs)
    @city = city
    @raw_jobs = raw_jobs
    @languages = ['JavaScript', 'Java', 'Python', 'Ruby', 'Scala']
  end

  def find_language(description)
    @languages.each do |language|
      return language if description.include?(language)
    end
    return 'Other'
  end
end
