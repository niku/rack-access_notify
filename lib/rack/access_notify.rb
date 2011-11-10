require "rack/access_notify/version"
require "growl"

module Rack
  class AccessNotify
    FORMAT = "%s %s%s"

    def initialize(app)
      @app = app
    end

    def call(env)
      message = FORMAT % [
        env["REQUEST_METHOD"],
        env["PATH_INFO"],
        env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"]
      ]
      Growl.notify(message, title:"access has come", name:"Rack::AccessNotify")
      @app.call(env)
    end
  end
end
