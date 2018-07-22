#!/bin/bash

set -e

_CURR_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

docker run -t -v ${_CURR_DIR}/artifacts:/runner/artifacts \
 -v ${_CURR_DIR}/env:/runner/env \
 -v ${_CURR_DIR}/inventory:/runner/inventory \
 -v ${_CURR_DIR}/project:/runner/project \
 -v ${_CURR_DIR}/roles:/runner/roles \
 -e RUNNER_PLAYBOOK=provision-cloud-resources.yaml \
 docker.io/kameshsampath/ansible-runner:latest
