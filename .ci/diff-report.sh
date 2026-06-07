#!/bin/bash
set -e

case $1 in

download-files)
  mkdir -p .ci-temp
  touch .ci-temp/diff_config.xml
  echo "dummy: placeholder" > .ci-temp/projects.yml
  ;;

parse-pr-description-text)
  ./.ci/append-to-github-output.sh "projects_link" ""
  ./.ci/append-to-github-output.sh "config_link" ""
  ./.ci/append-to-github-output.sh "new_module_config_link" ""
  ./.ci/append-to-github-output.sh "patch_config_link" ""
  ./.ci/append-to-github-output.sh "report_label" ""
  ;;

*)
  echo "Unsupported argument: $1, continuing"
  ;;
esac
