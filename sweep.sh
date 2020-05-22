#!/bin/sh

# Copyright (C) 1995, Mats Kindahl. All rights reserved.
# This program is in the public domain, you can redistribute
# it and/or modify it as long as this copyright notice is
# kept.
#
# This software is delivered as-is. There is NO WARRANTY, neither
# implicit nor explicit, for this code.
#
# This code is intended to be portable. Therefore the use of
# /bin/sh. The author would very much like it if any portability
# problems were reported. That way they can be fixed.
#
# E-mail: matkin@docs.uu.se
#
# %W%
# %Z%A program to remove unwanted files from a directory tree

# A nice program that removes unwanted files from a directory and its
# subdirectories.

# Argument 1 is the directory where to start the search. It defaults to
#    your home directory. If there is no directory by this name the
#    argument is assumed to be a pattern and included in the list of
#    patterns that match the files to remove.

# Arguments after the directory is standard unix file-name patterns that
#    match the files that are to be removed, it defaults to
#    '*~' '.*~' 'core'

PATH=/usr/bin
default_files="'*~' '.*~' 'core'"
name=$0

command=rm			# Default command
print=-print			# Default is to print files removed

for x in "$@"; do
    case "$x" in
    -n) shift 			# No-remove
        unset command
        ;;
    -q) shift        		# Quiet
        unset print
        ;;
    -i) shift			# Inquire before removing
        command="rm -i"
        unset print
        ;;
    -*) shift
        echo "Usage: $name [ -n | -i | -q ] [ dir ] [ pattern . . . ]" 1>&2
	exit
        ;;
    *)  break
        ;;
    esac
done

# Is an argument supplied and is it a directory? If so, that is where
# to start the search.
if [ -n "$1" -a -d "$1" ]; then
    dir=$1
    shift
fi

# Any arguments remaining? If not a default set of files to search for
# is used.
if [ "$#" -le 0 ]; then
# Have we got file-name patterns in SWEEP_FILES they are to be used
    set ${SWEEP_FILES:-$default_files}
fi

{
  echo "( -name $1"
  shift
  for F do
    echo "-o -name $F"
  done
  echo ") $print"
  if [ -n "$command" ]; then
    echo "-exec $command {} ;"
  fi
} | xargs find ${dir:-$HOME} -type f
