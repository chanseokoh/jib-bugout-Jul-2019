#!/bin/sh

set -o errexit

echo "Cleaning Jib base image cache..."
rm -rf "${HOME}/.cache/google-cloud-tools-java/jib"
echo "Cleaning Jib application caches..."
rm -rf */target/jib-cache */build/jib-cache

echo
echo "You may want to clean Docker cache too!"
echo "  docker kill \$( docker ps -aq )"
echo "  docker rmi \$( docker images -q )"
echo
