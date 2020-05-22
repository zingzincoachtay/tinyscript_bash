# https://stackoverflow.com/questions/1444406/how-can-i-delete-duplicate-lines-in-a-file-in-unix

awk '!seen[$0]++' file

# delete duplicate, consecutive lines from a file (emulates "uniq").
# First line in a set of duplicate lines is kept, rest are deleted.
sed '$!N; /^\(.*\)\n\1$/!P; D' file

# delete duplicate, nonconsecutive lines from a file. Beware not to
# overflow the buffer size of the hold space, or else use GNU sed.
sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P' file

# Perl one-liner similar to @jonas's awk solution:
perl -ne 'print if ! $x{$_}++' file
# This variation removes trailing whitespace before comparing:
perl -lne 's/\s*$//; print if ! $x{$_}++' file
# This variation edits the file in-place, and makes a backup file.bak
perl -i.bak -ne 'print if ! $x{$_}++' file

