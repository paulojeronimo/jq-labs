#!/usr/bin/env bash
# https://stackoverflow.com/a/60642810

mkdir -p .tmp
f=.tmp/1.json

cat <<EOF > $f
{
  "total_count": 3,
  "artifacts": [
    {
      "id": 0000001,
      "node_id": "MDg6QXJ0aWZhY3QyNzUxNjI1",
      "name": "artifact-1",
      "size_in_bytes": 1,
      "url": "https://api.github.com/repos/:owner/:repo/actions/artifacts/2751625",
      "archive_download_url": "https://api.github.com/repos/:owner/:repo/actions/artifacts/2751625/zip",
      "expired": false,
      "created_at": "2020-03-10T18:21:23Z",
      "updated_at": "2020-03-10T18:21:24Z"
    },
    {
      "id": 0000002,
      "node_id": "MDg6QXJ0aWZhY3QyNzUxNjI0",
      "name": "artifact-2",
      "size_in_bytes": 2,
      "url": "https://api.github.com/repos/:owner/:repo/actions/artifacts/2751624",
      "archive_download_url": "https://api.github.com/repos/:owner/:repo/actions/artifacts/2751624/zip",
      "expired": false,
      "created_at": "2020-03-10T18:21:23Z",
      "updated_at": "2020-03-10T18:21:24Z"
    },
    {
      "id": 0000003,
      "node_id": "MDg6QXJ0aWZhY3QyNzI3NTk1",
      "name": "artifact-3",
      "size_in_bytes": 3,
      "url": "https://api.github.com/repos/docker/mercury-ui/actions/artifacts/2727595",
      "archive_download_url": "https://api.github.com/repos/:owner/:repo/actions/artifacts/2727595/zip",
      "expired": false,
      "created_at": "2020-03-10T08:46:08Z",
      "updated_at": "2020-03-10T08:46:09Z"
    }
  ]
}
EOF

jq '.artifacts | map(.size_in_bytes) | add' < $f
