#!/bin/sh
# Hook installation script
# Creates .git/hooks/pre-commit symlink to scripts/pre-commit.sh

SCRIPT_DIR=$(dirname "$0")
ln -f -s ../../scripts/pre-commit.sh $SCRIPT_DIR/../.git/hooks/pre-commit
