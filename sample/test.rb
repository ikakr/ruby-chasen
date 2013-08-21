#!/usr/local/bin/ruby
require "chasen.o"

Chasen.getopt("-F", '(%BB %m %M)\n', "-j")
puts Chasen.sparse("こんにちは。")
#puts Chasen.sparse("本日は、晴天なり。")

include Chasen
for arg in ARGV
   file = open(arg, "r")
   while ret = fparse(file)
      puts ret
   end
end


