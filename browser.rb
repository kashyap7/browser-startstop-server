
# Module to handle implementation specific functionalities
# I could have a class for Browser which would instanstiate objects for each browser-types and call the respective functionalities
# but then I don't need state do modules would be a better fit!

# module Firefox
#   def start
#     `open -a firefox`
#   end
# end

# module Chrome
#   def start
#     `open -a 'Google\ Chrome'`
#   end
# end

# module Safari
#   def start
#     `open -a safari`
#   end
#end

# I think we can use string interpolation for the start and stop!

module Browser
  extend self
  BROWSER_EXEC = {
    :firefox => "firefox",
    :safari => "safari",
    :chrome => "Google\ Chrome"
  }
  def spawn_browser(which_browser)
    system("open -a \"#{BROWSER_EXEC[which_browser.downcase.intern]}\"")
    # case which_browser.downcase
    # when "firefox"
    #   Firefox::start
    # when "chrome"
    #   Chrome::start
    # when "firefox"
    #   Firefox::start
    # else
    #   return ""
    # end
  end
  def kill_browser(which_browser)
    system("pkill -a \"#{BROWSER_EXEC[which_browser.downcase.intern]}\"")
  end
end
