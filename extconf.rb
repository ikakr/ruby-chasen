require "mkmf"

have_library 'stdc++'
dir_config 'chasen'
have_library 'chasen', 'chasen_getopt_argv' and create_makefile 'chasen'
