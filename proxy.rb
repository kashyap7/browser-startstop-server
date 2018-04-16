
# Setting the proxy would need a reboot. Should add the reboot once the server could be launched as a boot service.
# Have decided to have simple if .. else .. block instead of have a seperate class/module because we only have 2 functions to handle.
module Proxy
  extend self
  require_relative 'OS.rb'
  def set(proxy_config)
    if OS.mac?
      puts "networksetup -setwebproxy Wi-Fi #{proxy_config['host']} #{proxy_config['port']}"
      system("networksetup -setwebproxy Wi-Fi #{proxy_config['host']} #{proxy_config['port']}")
    else
      system("./proxy_set #{proxy_config['host']} #{proxy_config['port']}")
    end
  end

  def unset
    if OS.mac?
      puts "networksetup -setsecurewebproxystate Wi-Fi off"
      system("networksetup -setsecurewebproxystate Wi-Fi off")
    else
      system("./proxy_unset")
    end
  end
end
