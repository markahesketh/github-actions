#!/bin/bash

# Get a list of recently changed files
COMMIT_HEAD_BACK=50
GIT_PREVIOUS_SUCCESSFUL_COMMIT="HEAD~${COMMIT_HEAD_BACK}"
GIT_RANGE="${GIT_PREVIOUS_SUCCESSFUL_COMMIT}...HEAD"

CHANGED_FILE_LIST=()
FILE_LIST="$(set +e; set -x; git log --name-only --pretty="" --no-notes --diff-filter=d "${GIT_RANGE}" | sort | uniq)"

for MODIFIED_FILE in ${FILE_LIST}
do
  if [[ ! -f $MODIFIED_FILE ]]; then
      echo "File ${MODIFIED_FILE} doesn't exist, ignoring"
  elif [[ $MODIFIED_FILE =~ ^(custom\/src) ]]; then
    CHANGED_FILE_LIST+=($MODIFIED_FILE)
  fi
done

# Convert array to a string
ANALYSIS_FILE_LIST=$(printf ",%s" "${CHANGED_FILE_LIST[@]}")
ANALYSIS_FILE_LIST=${ANALYSIS_FILE_LIST:1}

if [[ -z "${ANALYSIS_FILE_LIST}" ]]; then
    echo "No files or folders to analyse"
    exit 0
fi

echo "Modified files:"
echo "${ANALYSIS_FILE_LIST}"

# Install dependencies
composer install ${INPUT_COMPOSER_INSTALL_ARGUMENTS}

PHAN_ARGS="--include-analysis-file-list ${ANALYSIS_FILE_LIST} ${INPUT_PHAN_ARGUMENTS}"
echo "${PHAN_ARGS}"

# Run Phan
./custom/vendor/bin/phan $PHAN_ARGS

# Format the output with CS2PR
./custom/vendor/bin/cs2pr ${INPUT_CS2PR_ARGUMENTS}