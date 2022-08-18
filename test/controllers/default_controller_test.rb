# frozen_string_literal: true

require 'test_helper'

class DefaultControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get default_index_url
    assert_response :success
  end

  test 'should get search' do
    api_response_data = File.read(Rails.root.join('test/fixtures/files/cs_json_response.json'))
    json = JSON.parse(api_response_data)
    CollegeSearchApi.any_instance.expects(:schools).returns(json)
    get default_search_url, params: { query: 'texas' }
    assert_response :success
    assert_equal assigns(:schools).count, json['results'].count
  end
end
