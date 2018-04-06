
require 'sinatra'
require_relative 'browser.rb'
require_relative 'proxy.rb'

set :port, 9494

SUPPORTED_BROWSERS = ["chrome", "firefox", "safari"]

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

def sanitize_browser_string(browser)
  if SUPPORTED_BROWSERS.include? browser.downcase
    return browser.downcase.intern
  else
    return false
  end
end

post '/browser/start' do
  browser_config = json_params
  puts browser_config['browser']

  browser_sym = sanitize_browser_string(browser_config['browser'])
  if browser_sym
    puts browser_config.is_a? Hash
    url = browser_config.has_key?("url") ? browser_config['url'] : ""
    puts url.class
    puts browser_config.class
    if Browser::spawn(browser_sym, url)
      status 200
    else
      status 404
    end
  else
    status 400
  end
end

post '/browser/stop/:browser' do |browser|
  browser_sym = sanitize_browser_string(browser)

  if browser_sym
    if Browser::kill(browser_sym)
      status 200
    else
      status 404
    end
  else
    status 400
  end
end

post '/browser/cleanup/:browser' do |browser|
  browser_sym = sanitize_browser_string(browser)

  if browser_sym
    if Browser::cleanup(browser_sym)
      status 200
    else
      status 404
    end
  else
    status 400
  end
end

post '/proxy/set' do
  proxy_config = json_params
  if Proxy::set(proxy_config)
    status 200
  else
    status 404
  end
end

put '/proxy/unset' do
  if Proxy::unset
    status 200
  else
    status 404
  end
end
