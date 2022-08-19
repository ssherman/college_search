# frozen_string_literal: true

# helper module for the default controller
module DefaultHelper
  def google_maps_url(school)
    api_key = ENV['GOOGLE_API_KEY']
    name = school['latest.school.name']
    lat = school['location.lat']
    long = school['location.lon']
    params = {
      key: api_key,
      q: name
    }

    params.merge!(center: [lat, long].join(', ')) unless lat.nil? && long.nil?
    "https://www.google.com/maps/embed/v1/place?#{params.to_query}"
  end

  def calculate_results_count(results_per_page, total_results_count)
    total_results_count < results_per_page ? total_results_count : results_per_page
  end
end
