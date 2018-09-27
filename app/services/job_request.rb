class JobRequest
  def self.jobs(city, language)
    new(city, language).get_jobs
  end

  def get_jobs
    JSON.parse(request.body, symbolize_names: true)
  end

  def initialize(city, language)
    @city = city
    @language = language
  end

  def conn
    Faraday.new(url: "https://jobs.github.com/positions.json")
  end

  def request
    conn.get do |req|
      req.params[:location] = @city
      req.params[:description] = @language
    end
  end
end
