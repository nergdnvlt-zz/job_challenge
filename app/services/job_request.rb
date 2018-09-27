class JobRequest
  def self.jobs_by_city(city)
    new(city).jobs_by_city
  end

  def jobs_by_city
    raw_jobs
  end

  def initialize(city)
    @city = city
  end

  def conn
    Faraday.new(url: "https://jobs.github.com/positions.json?location=#{@city}")
  end

  def response
    conn.get { |req| }
  end

  def raw_jobs
    JSON.parse(response.body, symbolize_names: true)
  end
end
