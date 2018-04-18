#TODO : Make all the functions class functions 
require 'open5'
require 'open3'
module MacBrowser
  extend self
  BROWSER_EXEC = {
    :firefox => "firefox",
    :safari => "safari",
    :chrome => "Google\ Chrome"
  }

  def clean_browser_string(browser)
    if BROWSER_EXEC.include? browser.downcase.intern
      return browser.downcase.intern
    else
      return false
    end
  end

  def spawn(browser, url)
    puts "open -a \"#{BROWSER_EXEC[browser]}\" #{url}"
    system("open -a \"#{BROWSER_EXEC[browser]}\" #{url}")
  end

  def kill(browser)
    puts "pkill -a -i \"#{BROWSER_EXEC[browser]}\""
    system("pkill -a -i \"#{BROWSER_EXEC[browser]}\"")
  end

  def cleanup(browser)
    puts "#{BROWSER_EXEC[browser]}-cleanup.sh"
    system("./mac/#{BROWSER_EXEC[browser]}-cleanup.sh")
  end
end

module WindowBrowser
  extend self
  BROWSER_EXEC = {
    :firefox => "firefox.exe",
    :ie => "iexplore.exe",
    :chrome => "Chrome.exe"
  }

  def clean_browser_string(browser)
    if BROWSER_EXEC.include? browser.downcase.intern
      return browser.downcase.intern
    elsusing 
      return false
    end
  end

  def spawn(browser, url)
    # the server does not get the control back with the system command
    puts "#{BROWSER_EXEC[browser]} #{url}"
    stdout, stderr, status = open5("#{BROWSER_EXEC[browser]} #{url}")
    status
  end

  def kill(browser)
    puts "TaskKill /F /IM #{BROWSER_EXEC[browser]}"
    system("TaskKill /F /IM #{BROWSER_EXEC[browser]}")
    #puts "windows kill"
  end

  def cleanup(browser)

    # We kill the browser before we cleanup, as cleanup is not possible while the files are still in use.
    kill(browser)

    puts "#{BROWSER_EXEC[browser]}.bat"
    system("./windows/#{BROWSER_EXEC[browser]}.bat")
  end
end
