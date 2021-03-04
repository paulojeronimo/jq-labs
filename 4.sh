#!/usr/bin/env bash
# https://stackoverflow.com/questions/26128753/how-do-i-collect-unique-elements-of-an-array-valued-field-across-multiple-object

mkdir -p .tmp

echo '{"foo":"one", "bar":2, "baz":[0]}' > .tmp/4.1.json
echo '{"foo":"two", "bar":3, "baz":[1]}' > .tmp/4.2.json
echo '{"foo":"one", "bar":3, "baz":[2,3]}' > .tmp/4.3.json
echo '{"foo":"one", "bar":2, "baz":[2,4]}' > .tmp/4.4.json

jq -s '
group_by(.foo) |
map({foo: .[0].foo, bar: map(.bar) |
unique, baz: map(.baz) |
add |
unique})' .tmp/4.?.json
