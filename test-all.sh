#!/usr/bin/env bash

if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
  echo "Testing all scripts";
  export AWS_PROFILE=localstack;
  docker compose up -d --build \
  && cd 0000-setup \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0100-defining-resources \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0200-references \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0300-output \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0400-data \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0500-variables \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0600-modules/roots/dev \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
    && cd - \
  && cd 0700-remote-state \
    && pwd \
    && terraform init \
    && terraform apply -auto-approve \
  && cat << "EOF"
#####################################
TODO:

- [ ] Remove commented out code in 0700-remote-state/version.tf
- [ ] Run 'terraform init' again in 0700-remote-state

If all goes well:

- [ ] Shut down the localstack container
- [ ] git clean -xdnf
#####################################
EOF
else
  echo "You need to source this script ... Please try 'source setup.sh'."
fi
