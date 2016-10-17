require 'test_helper'

class ConverterTest < ActiveSupport::TestCase
  setup do
    @converter = Converter.new(2, "EUR", "USD")
    # @scrapped_response = @converter.scraping_api

    # crooked response
    response = File.read(Rails.root + 'test/test_data/conversion_response.json')

    # going for stub request
    stub_request(:get, "http://api.fixer.io/latest?symbols=USD&base=EUR").
    to_return(:body => response)
  end

  test 'should contain hash as response' do
    assert_kind_of Hash, @converter.parse_response_of(@converter.scraping_api),
    'Invalid response. Resonse should have valid JSON format.'
  end

  test 'should contain rates key' do
    assert_includes @converter.parse_response_of(@converter.scraping_api).keys, 'rates',
    'response not having rates key'
  end

  test 'should have Hash as rates value' do
    assert_kind_of Hash, @converter.parse_response_of(@converter.scraping_api)['rates'],
    'should contain Hash as value of rates key'
  end

  test 'should have target currency(USD) as key' do
    assert_includes @converter.parse_response_of(@converter.scraping_api)['rates'].keys, 'USD',
    'should have target currency as key'
  end

  test 'should provide accurate result for EUR to USD conversion' do
    assert_equal 4, @converter.convert!
  end

end
