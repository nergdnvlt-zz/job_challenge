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

class CalcPercentPresenter < DelegatePresenter::Base
  attr_reader :name, :jobs

  def initialize(city)
    @city = city
    @name = city.name
    @jobs = city.jobs.all
  end

  def total_count
    @city.jobs.count
  end

  def lang_count(lang, job_time)
    @city.jobs.where(language: lang, job_type: job_time).count.to_f
  end

  def java_full_percent
    (lang_count('Java', 'Full Time') / total_count) * 100
  end

  def java_part_percent
    (lang_count('Java', 'Part Time') / total_count) * 100
  end

  def javascript_full_percent
    (lang_count('JavaScript', 'Full Time') / total_count) * 100
  end

  def javascript_part_percent
    (lang_count('JavaScript', 'Part Time') / total_count) * 100
  end

  def python_full_percent
    (lang_count('Python', 'Full Time') / total_count) * 100
  end

  def python_part_percent
    (lang_count('Python', 'Full Time') / total_count) * 100
  end

  def ruby_full_percent
    (lang_count('Ruby', 'Full Time') / total_count) * 100
  end

  def ruby_part_percent
    (lang_count('Ruby', 'Part Time') / total_count) * 100
  end

  def scala_full_percent
    (lang_count('Scala', 'Full Time') / total_count) * 100
  end

  def scala_part_percent
    (lang_count('Scala', 'Part Time') / total_count) * 100
  end

  def other_full_percent
    (lang_count('Other', 'Full Time') / total_count) * 100
  end

  def other_part_percent
    (lang_count('Other', 'Part Time') / total_count) * 100
  end
end
