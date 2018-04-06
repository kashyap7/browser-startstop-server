
module Browser
  extend self
  BROWSER_EXEC = {
    :firefox => "firefox",
    :safari => "safari",
    :chrome => "Google\ Chrome"
  }
  def spawn(browser, url)
    puts "open -a \"#{BROWSER_EXEC[browser]}\" #{url}"
    system("open -a \"#{BROWSER_EXEC[browser]}\" #{url}")
  end

  def kill(browser)
    puts "pkill -a \"#{BROWSER_EXEC[browser]}\""
    system("pkill -a \"#{BROWSER_EXEC[browser]}\"")
  end

  def cleanup(browser)
    puts "#{BROWSER_EXEC[browser]}-cleanup.sh"
    system("./#{BROWSER_EXEC[browser]}-cleanup.sh")
  end
end
