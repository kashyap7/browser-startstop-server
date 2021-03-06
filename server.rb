
require 'sinatra'
require_relative 'browser.rb'
require_relative 'proxy.rb'
require_relative 'OS.rb'
set :port, 9499

def browser_factory
  if OS.mac?
    return MacBrowser
  elsif OS.windows?
    return WindowBrowser
  end
end

BROWSER = browser_factory

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

post '/browser/start' do
  browser_config = json_params
  puts browser_config['browser']
  # puts ENV['PATH']
  browser_sym = BROWSER::clean_browser_string(browser_config['browser'])
  if browser_sym
    puts browser_config.is_a? Hash
    url = browser_config.has_key?("url") ? browser_config['url'] : ""
    puts url.class
    puts browser_config.class
    if BROWSER::spawn(browser_sym, url)
      status 200
    else
      status 404
    end
  else
    status 400
  end
end

post '/browser/stop/:browser' do |browser|
  browser_sym = BROWSER::clean_browser_string(browser)

  if browser_sym
    if BROWSER::kill(browser_sym)
      status 200
    else
      status 404
    end
  else
    status 400
  end
end

post '/browser/cleanup/:browser' do |browser|
  browser_sym = BROWSER::clean_browser_string(browser)

  if browser_sym
    if BROWSER::cleanup(browser_sym)
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
