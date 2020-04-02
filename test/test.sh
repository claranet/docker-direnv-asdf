#!/bin/bash
set -euo pipefail

echo "Test AWS credentials..."
aws s3 ls --profile claranetuk-thirdplayground
echo

echo "Test Pretf and Terraform..."
pretf version
echo

echo "Test environment variables..."
echo TOP=$TOP
echo SUBDIR=$SUBDIR
