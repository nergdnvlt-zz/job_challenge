class JobEvaluator
  def self.create_job(language, attrs)
    new(language, attrs).build_job_attrs
  end

  def build_job_attrs
    Job.create(
      language: @language,
      title: @title,
      job_type: @job_type
    )
  end

  def initialize(language, attrs)
    @language = language
    @title = attrs[:title]
    @job_type = attrs[:type]
  end
end
