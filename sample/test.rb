#!/usr/local/bin/ruby
require "chasen.o"

Chasen.getopt("-F", '(%BB %m %M)\n', "-j")
puts Chasen.sparse("����ˤ��ϡ�")
#puts Chasen.sparse("�����ϡ���ŷ�ʤꡣ")

include Chasen
for arg in ARGV
   file = open(arg, "r")
   while ret = fparse(file)
      puts ret
   end
end


