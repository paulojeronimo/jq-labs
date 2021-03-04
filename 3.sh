#!/usr/bin/env bash
# https://stackoverflow.com/a/28485485

mkdir -p .tmp

echo '{ "a": 10, "b": 11 }' > .tmp/3.1.json
echo '{ "a": 20, "b": 21 }' > .tmp/3.2.json
echo '{ "a": 30, "b": 31 }' > .tmp/3.3.json

jq -n '
reduce (inputs | to_entries[]) as {$key,$value} ({}; .[$key] += $value)
' .tmp/3.?.json
