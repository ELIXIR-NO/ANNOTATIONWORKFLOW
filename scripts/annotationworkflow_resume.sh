#!/bin/bash
nohup conda run -n nextflow_25.04.2 nextflow -log ./EGRESS/ANNOTATIONWORKFLOW.log run -profile PRODUCTION -w $1 -N $3 main.nf -resume $2 > ./EGRESS/ANNOTATIONWORKFLOW_resume.out &
