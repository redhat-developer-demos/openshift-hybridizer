#!/bin/bash

set -e

_CURR_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Delete all the existing Cloud Providers Hosts folder
rm -rf inventory/gcp
rm -rf inventory/aws
rm -rf inventory/azr

docker run -t -v ${_CURR_DIR}/artifacts:/runner/artifacts \
 -v ${_CURR_DIR}/env:/runner/env \
 -v ${_CURR_DIR}/inventory:/runner/inventory \
 -v ${_CURR_DIR}/project:/runner/project \
 -v ${_CURR_DIR}/roles:/runner/roles \
 -e RUNNER_PLAYBOOK=deprovision-cloud-resources.yaml \
 kameshsampath/ansible-runner:latest
