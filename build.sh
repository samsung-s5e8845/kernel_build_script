#!/usr/bin/env bash

set -e
set -o pipefail

LOGFILE="build_output.txt"

echo "Building kernel ..."

tools/bazel run \
  --show_progress \
  --progress_report_interval=10 \
  --nocheck_bzl_visibility \
  --lto=thin \
  --config=stamp \
  --sandbox_debug \
  --verbose_failures \
  --debug_make_verbosity=I \
  //projects/s5e8845:s5e8845_user_dist \
  2>&1 | tee "$LOGFILE"

echo "Build finished. See log: $LOGFILE"
