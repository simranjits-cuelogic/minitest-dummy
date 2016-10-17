class Converter
  def initialize(amount, source = "EUR", target = "USD")
    @amount = amount
    @target = target
    @source = source
  end

  def convert!
    rate = get_rate(scraping_api)
    @amount * rate
  end

  # private
  # def parse_response_for_rate(body)
  #   # expected response format
  #   # {"base":"USD","date":"--","rates":{"EUR":0.90893}}

  #   JSON.parse(body)["rates"][@target]
  # end

  def parse_response_of body
    JSON.parse(body)
  end

  def get_rate scraping_data
    response_body = parse_response_of(scraping_data)

    response_body["rates"][@target]
  end

  def scraping_api
    url = URI(api_url)
    Net::HTTP.get(url)
  end

  def api_url
    "http://api.fixer.io/latest?symbols=#{@target}&base=#{@source}"
  end
end