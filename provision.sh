#!/bin/bash

set -e

_CURR_DIR="$( cd "$(dirname "$0")" ; pwd -P )"

docker run -t -u `id -u` -v ${_CURR_DIR}/artifacts:/runner/artifacts:Z \
 -v ${_CURR_DIR}/out:/runner/out:Z \
 -v ${_CURR_DIR}/env:/runner/env:Z \
 -v ${_CURR_DIR}/inventory:/runner/inventory:Z \
 -v ${_CURR_DIR}/project:/runner/project:Z \
 -v ${_CURR_DIR}/roles:/runner/roles:Z \
 -e PROJECT_DIR=${_CURR_DIR}/project \
 -e RUNNER_PLAYBOOK=provision-cloud-resources.yaml \
 docker.io/kameshsampath/ansible-runner:latest
