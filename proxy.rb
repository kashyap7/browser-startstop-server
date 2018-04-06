
module Proxy
  extend self
  def set(proxy_config)
  	puts "networksetup -setwebproxy Wi-Fi #{proxy_config['host']} #{proxy_config['port']}"
  	system("networksetup -setwebproxy Wi-Fi #{proxy_config['host']} #{proxy_config['port']}")
  end
  def unset
  	puts "networksetup -setsecurewebproxystate Wi-Fi off"
  	system("networksetup -setsecurewebproxystate Wi-Fi off")
  end
end
