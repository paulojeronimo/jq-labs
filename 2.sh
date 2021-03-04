#!/usr/bin/env bash
# https://unix.stackexchange.com/a/600773
# https://stackoverflow.com/questions/6085156/using-semicolon-vs-plus-with-exec-in-find

mkdir -p .tmp

echo '{ "a": 10, "b": 11 }' > .tmp/2.1.json
echo '{ "a": 20, "b": 21 }' > .tmp/2.2.json
echo '{ "a": 30, "b": 31 }' > .tmp/2.3.json

echo "jq output 1:"
jq length .tmp/2.?.json

echo "jq output 2:"
jq -s 'map(length) | add' .tmp/2.?.json

echo "jq output 3 (same as above but without problems with command line length):"
find .tmp -maxdepth 1 -name '2.?.json' -exec jq 'length' {} + | jq -s 'add'

echo "jq output 4 (using awk):"
jq length .tmp/2.?.json | awk '{sum=sum+$0} END{print sum}'
