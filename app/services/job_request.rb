class JobRequest
  def self.jobs(city)
    new(city).get_jobs
  end

  def get_jobs
    JSON.parse(request.body, symbolize_names: true)
  end

  def initialize(city)
    @city = city
  end

  def conn
    Faraday.new(url: "https://jobs.github.com/positions.json")
  end

  def request
    conn.get do |req|
      req.params[:location] = @city
    end
  end
end
