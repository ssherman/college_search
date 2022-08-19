# frozen_string_literal: true

# wrapper class around the api.data.gov college
# scorecard api
class CollegeSearchApi
  attr_reader :api_key

  API_URL = 'https://api.data.gov/ed/collegescorecard/v1/'
  private_constant :API_URL

  def initialize(api_key)
    @api_key = api_key
  end

  def schools(query)
    response = client.get('schools.json') do |req|
      req.params['school.name'] = query
    end
    JSON.parse(response.body)
  end

  private

  def client
    @client ||= Faraday.new(
      url: API_URL,
      params: {
        api_key:,
        fields: 'id,location,latest.school.name'
      }
    )
  end
end
