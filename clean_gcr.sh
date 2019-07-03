#!/bin/sh

echoRed() {
  echo "$(tput setaf 1; tput bold)$1$(tput sgr0)"
}

echoGreen() {
  echo "$(tput setaf 2; tput bold)$1$(tput sgr0)"
}

GCP_PROJECT=$1
if [ -z "$1" ]; then
  GCP_PROJECT=$( gcloud config get-value project )
fi

delete_images() {
  echoGreen "* Deleting images in ${1}..."

  local tags=$( gcloud container images list-tags "${1}" --format='get(digest)' \
    | sed -e "s,^,${1}@," )
  if [ -n "${tags}" ]; then
    gcloud container images delete --quiet --force-delete-tags $tags
  else
    echo "no tags to delete"
  fi
}

delete_repository() {
  local repositories=$( gcloud container images list --repository="${1}" )
  for repo in ${repositories}; do
    if [ "${repo}" != "NAME" ]; then
      ( delete_repository "${repo}" )
      delete_images "${repo}"
    fi
  done
}

delete_repository "gcr.io/${GCP_PROJECT}"
