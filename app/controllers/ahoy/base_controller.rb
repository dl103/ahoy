module Ahoy
  class BaseController < ApplicationController
    # skip all filters except for authlogic
    skip_filter *(_process_action_callbacks.map(&:filter) - [:load_authlogic])
    before_filter :slowdown

    def ahoy
      @ahoy ||= Ahoy::Tracker.new(controller: self, api: true)
    end

    def slowdown
      session[:activate] = true
      sleep 10
    end
  end
end
