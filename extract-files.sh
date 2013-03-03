#!/bin/sh

set -e

export DEVICE=dlx
export VENDOR=htc
./../msm8960-common/extract-files.sh $@
