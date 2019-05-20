#!/bin/bash
set -e

cd ..
rm -f docs/models/dynamic/*
for i in $(find models/* -maxdepth 1 -type d); do
    model=`basename $i`
    make build-model-doc MODEL=$model
done
