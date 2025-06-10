#!/bin/bash
unlink ./INGRESS
unlink ./EGRESS
ln -s $1 ./INGRESS
ln -s $2 ./EGRESS
./scripts/clean.sh
rm ./OUTPUT_ANNOTATIONPIPELINE/*
conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/ANNOTATIONPIPELINE.log run -profile ANNOTATIONPIPELINE_test -w $3 ./modules/ANNOTATIONPIPELINE/main.nf