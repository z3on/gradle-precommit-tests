#!/bin/sh
# Pre-commit hook to run tests before commit
# Runs tests only for staged changes using remote run of TeamCity build

declare -r teamcity_host="https://tc-example:8111"
declare -r build="GradleSampleProject_GradleTests"
declare -r run_message="pre-commit tests run"

# stash any unstaged changes
git stash -q --keep-index

# get list of staged files
files=$(git diff --cached --name-only | tr '\n' ' ')

# run TeamCity build for staged changes
java -jar scripts/tcc.jar run --host $teamcity_host -c $build -m $run_message $files

# save remote run exit code
RESULT=$?

# restore unstaged changes
git stash pop -q

# return build exit code to prevent commit in case of errors
exit $RESULT
