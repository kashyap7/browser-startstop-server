#TODO : Make all the functions class functions 
require 'open5'
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
    system("./#{BROWSER_EXEC[browser]}-cleanup.sh")
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
    else
      return false
    end
  end

  def spawn(browser, url)
    puts "#{BROWSER_EXEC[browser]} #{url}"
    system("#{BROWSER_EXEC[browser]} #{url}")
    #puts open5("firefox")
  end

  def kill(browser)
    puts "TaskKill /F /IM #{BROWSER_EXEC[browser]}"
    system("TaskKill /F /IM #{BROWSER_EXEC[browser]}")
    #puts "windows kill"
  end

  def cleanup(browser)
    kill(browser)

    puts "#{BROWSER_EXEC[browser]}.bat"
    system("./#{BROWSER_EXEC[browser]}.bat")
  end
end
