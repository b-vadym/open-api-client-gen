#!/bin/sh
set -e

IMAGE="vadim2991/open-api-client-gen"
TAG="${1:-latest}"

docker buildx build \
  --platform linux/amd64 \
  --tag "$IMAGE:$TAG" \
  --push \
  .

echo ""
echo "Pushed: $IMAGE:$TAG"
echo ""
echo "Run on any server:"
echo "  docker run -d -t -p 3030:3030 $IMAGE:$TAG"
