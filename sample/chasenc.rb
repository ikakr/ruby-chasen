#!/usr/local/bin/ruby

require "chasen.o"
include Chasen

form_usage = [
	"Conversion characters of -F option:\n",
	"  %m    surface form (inflected form)\n",
	"  %M    surface form (base form)\n",
	"  %y    pronounciation (inflected form)\n",
	"  %Y    pronounciation (base form)\n",
	"  %i    semantic information\n",
	"  %Ic   semantic information (if NIL, print character 'c'.)\n",
	"  %h    part of speech (code)\n",
	"  %H    part of speech (name)\n",
	"  %b    sub-part of speech (code)\n",
	"  %BB   sub-part of speech (name)(if not, print part of speech)\n",
	"  %BM   sub-part of speech (name)(if not, print part of speech)\n",
	"  %Bc   sub-part of speech (name)(if not, print character 'c')\n",
	"  %t    inflection type (code)\n",
	"  %Tc   inflection type (name)(if not, print character 'c')\n",
	"  %f    inflected form (code)\n",
	"  %Fc   inflected form (name)(if not,  print character 'c')\n",
	"  %c    cost value of the morpheme\n",
	"  %%    '%'\n",
	"  .     specify the field width\n",
	"  -     specify the field width\n",
	"  1-9   specify the field width\n",
	"  \\n    carriage return\n",
	"  \\t    tab\n",
	"  \\\\    back slash\n",
	"  \\'    single quotation mark\n",
	"  \\\"    double quotation mark\n",
	"\n",
	"Examples:\n",
	"  \"\%M \"         split words by space (wakachi-gaki)\n",
	"  \"\%y\"          Kana to Kanji conversion\n",
	"  \"\%r ()\"       print with ruby\n",
	"\n",
	"Note:\n",
	"  If the format ends with `\\n' then outputs `EOS',\n",
	"  otherwise outputs newline every sentence.\n"
]

usage = [
	"Usage: chasenc.rb [options]\n",
	"  -b             show the best path (default)\n",
	"  -m             show all morphemes\n",
	"  -p             show all paths\n",
	"\n",
	"  -f             show formatted morpheme data (default)\n",
	"  -e             show entire morpheme data\n",
	"  -c             show coded morpheme data\n",
	"  -d             show detailed morpheme data for Prolog\n",
	"  -v             show detailed morpheme data for ViCha\n",
	"  -F format      show morpheme with formatted output\n",
	"  -Fh            print help of -F option\n",
	"\n",
	"  -j             Japanese sentence mode\n",
	"  -w width       specify the cost width\n",
	"  -L lang        specify languages\n",
	"  -h             print this help\n",
]

for i in ARGV
   if i =~ /^-h/
      print usage
      exit
   end
   if i =~ /^-Fh/
      print form_usage
      exit
   end
end

Chasen.getopt(*ARGV)

while STDIN.gets
   puts sparse($_)
end
