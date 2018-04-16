# #output = `open -a firefox`
# output = system("open -a firefox")
# print output.class
# print "\n"
# #puts system("open -a safari")
# #puts `open -a 'Google\ Chrome'`
# output = system("./test.sh")
# puts output.class

require_relative 'OS.rb'
require 'open5'
puts OS.mac?
puts RUBY_PLATFORM
puts OS.get

# a,b,c,d = open5("firefox")
# puts c
puts ENV['PATH']

#puts system('TaskKill /F /IM iexplore.exe')
puts system('./ie.bat')

