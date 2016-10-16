class ConverterTest < Minitest::Test
  def setup
    stub_request(:get, "http://api.fixer.io/latest?symbols=USD&base=EUR").
      to_return(:body => %Q(
      {
      "base": "EUR",
      "date": "2015-12-14",
      "rates": {
        "USD": 2.0
        }
      }
      ))
  end

  def it_converts_eur_to_usd
    assert_equal 4, Converter.new(2, "EUR", "USD").convert!
  end
end