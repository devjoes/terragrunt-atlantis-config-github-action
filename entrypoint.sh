#!/bin/bash

set -x
az login --service-principal -u "$CLIENT_ID" -p "$CLIENT_SECRET" --tenant "$TENANT_ID"
# Install the tool
export GO111MODULE=on
go get "github.com/transcend-io/terragrunt-atlantis-config@$1"

# Generate what the config should look like
shift
export FAST_MODE=true
terragrunt-atlantis-config generate --output atlantis.yaml.expected $@

# Enforce that the config looks how you'd expect
diff atlantis.yaml atlantis.yaml.expected
