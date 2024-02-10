require "kemal"
require "json"

module Fugu
  VERSION = "0.1.0"

  # Set content_type for all requests
  before_all do |env|
    env.response.content_type = "application/json"
  end

  # Routes
  get "/" do |env|
    {version: VERSION}.to_json
  end

  get "/up" do |env|
    {status: "OK"}.to_json
  end

  Kemal.config do |config|
    config.env = ENV["KEMAL_ENV"] ||= "development"
    config.port = 3000
    config.host_binding = "0.0.0.0"
  end
  
  # Starts Kemal
  Kemal.run
end
