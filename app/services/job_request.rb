class JobRequest
  def self.jobs_by_city(city, language)
    new(city, language).jobs_by_city
  end

  def jobs_by_city
    a = JSON.parse(request.body, symbolize_names: true)
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
      req.params[:language] = @language
    end
  end
end
