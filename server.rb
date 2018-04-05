
require 'sinatra'
require_relative 'browser.rb'

# configure do
#   REDISTOGO_URL = "redis://localhost:6379/"
#   uri = URI.parse(REDISTOGO_URL)
#   REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# end

set :port, 9494
before do
  content_type 'application/json'
end

def json_params
  begin
    JSON.parse(request.body.read)
  rescue
    halt 400, { message:'Invalid JSON' }.to_json
  end
end
# TODO: Do we need a class for all these functionalities?
# Do we need a class for browser and individual browsers inheriting it? 

post '/start' do
  browser_config = json_params
  puts browser_config['browser']
  if Browser::spawn_browser(browser_config['browser'])
    status 200
  else
    status 404
  end
end

post '/stop' do
  
end
