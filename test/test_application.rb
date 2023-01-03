# frozen_string_literal: true

require_relative 'test_helper'

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/'
    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end

  def test_content_type_response
    get '/'
    assert last_response.ok?
    content_type = last_response.headers['content-type']
    assert content_type['text/html']
  end
end