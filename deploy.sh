#!/bin/bash

image="registry.explabs.io/personal/nightscout"
version="$(date +%s)"
docker build -t $image:$version .
docker push $image:$version
perl -pi -e 's|'$image':?(\d+)?|'$image:$version'|g' k8s.yaml
kubectl apply -f k8s.yaml