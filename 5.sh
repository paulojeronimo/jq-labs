#!/usr/bin/env bash
cd "`dirname "$0"`"
mkdir -p .tmp

cat > .tmp/5.json <<EOF
{
	"items": [
		{"foo":"one", "bar":2, "baz":[0]},
		{"foo":"two", "bar":3, "baz":[1]},
		{"foo":"two", "bar":4, "baz":[1]},
		{"foo":"one", "bar":3, "baz":[2,3]},
		{"foo":"one", "bar":2, "baz":[2,4]},
		{"foo":"three", "bar":1, "baz":[1,3]},
		{"foo":"three", "bar":2, "baz":[2,4]}
	]
}
EOF

#jq . .tmp/5.json

#jq -c '.items[]' .tmp/5.json

# this won't work (because each item produced does not belong to an array):
#jq '.items[] | group_by(.foo)' .tmp/5.json

# this works (because the items will be inserted in an array):
#jq '[.items[]] | group_by(.foo)' .tmp/5.json

# worst alternative to the above:
#jq -c '.items[]' .tmp/5.json | jq -s 'group_by(.foo)'

#jq '[.items[]] | group_by(.foo)[]' .tmp/5.json

jq -c '[[.items[]]|group_by(.foo)[]|{(.[0].foo):map(del(.foo))}]' .tmp/5.json
