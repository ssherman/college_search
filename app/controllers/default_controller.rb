# frozen_string_literal: true

# default controller that handles all app endpoints
class DefaultController < ApplicationController
  def index; end

  def search
    @query = params[:query]
    response = api_client.schools(@query)

    @schools = response['results']
    @total_results_count = response['metadata']['total']
    @results_per_page = response['metadata']['per_page']
  end

  private

  def api_client
    api_key = ENV['CS_API_KEY']
    @api_client ||= CollegeSearchApi.new(api_key)
  end
end
