# frozen_string_literal: true

require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      env['PATH_INFO'] = '/home/index' if env['PATH_INFO'] == '/'

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      begin
        text = controller.send(act)
      rescue StandardError
        return [500, { 'Content-Type' => 'text/html' }, ['Something went wrong!']]
      end
      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end
end
