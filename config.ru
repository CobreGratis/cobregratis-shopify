require 'rack-canonical-host'
use Rack::CanonicalHost, ENV['CANONICAL_HOST'] if ENV['CANONICAL_HOST']

require './application'
require 'newrelic_rpm'

NewRelic::Agent.after_fork(:force_reconnect => true)

run Sinatra::Application