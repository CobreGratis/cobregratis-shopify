require 'rack-canonical-host'
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']

require './application'
run Sinatra::Application