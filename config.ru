$LOAD_PATH << "lib"

require 'rack'
require 'rack/access_notify'
require 'rack/lobster'

use Rack::AccessNotify
run Rack::Lobster.new
