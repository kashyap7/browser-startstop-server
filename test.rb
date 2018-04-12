# #output = `open -a firefox`
# output = system("open -a firefox")
# print output.class
# print "\n"
# #puts system("open -a safari")
# #puts `open -a 'Google\ Chrome'`
# output = system("./test.sh")
# puts output.class

require_relative 'OS.rb'
puts OS.mac?
puts RUBY_PLATFORM
puts OS.get