#!/usr/bin/env bash
# https://stackoverflow.com/questions/19529688/how-to-merge-2-json-objects-from-2-files-using-jq
cd "`dirname "$0"`"
mkdir -p .tmp

cat > .tmp/6.1.json <<'EOF'
{
    "value1": 200,
    "timestamp": 1382461861,
    "value": {
        "aaa": {
            "value1": "v1",
            "value2": "v2"
        },
        "bbb": {
            "value1": "v1",
            "value2": "v2"
        },
        "ccc": {
            "value1": "v1",
            "value2": "v2"
        }
    }
}
EOF

cat > .tmp/6.2.json <<'EOF'
{
    "status": 200,
    "timestamp": 1382461861,
    "value": {
        "aaa": {
            "value3": "v3",
            "value4": 4
        },
        "bbb": {
            "value3": "v3"
        },      
        "ddd": {
            "value3": "v3",
            "value4": 4
        }
    }
}
EOF

jq -s '.[0] * .[1]' .tmp/6.1.json .tmp/6.2.json
