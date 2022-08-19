# frozen_string_literal: true

# default controller that handles all app endpoints
class DefaultController < ApplicationController
  def index; end

  def search
    @query = params[:query]
    response = api_client.schools(@query)

    return if api_key_error(response)

    @schools = response.fetch('results')
    @total_results_count = response.dig('metadata', 'total')
    @results_per_page = response.dig('metadata', 'per_page')
  rescue StandardError => e
    Rails.logger.error { "error executing search: #{e.inspect}" }
    render partial: 'other_error'
  end

  private

  def api_client
    api_key = ENV['CS_API_KEY']
    @api_client ||= CollegeSearchApi.new(api_key)
  end

  # if the api key is wrong, we need to render an error
  def api_key_error(response)
    return if response.fetch('error', nil).nil?

    render partial: 'api_error', locals: {
      message: response.dig('error', 'message')
    }
    true
  end
end
