#!/bin/bash
#prokka --setupdb --dbdir $prokka_refdata
prokka --dbdir $prokka_refdata --cpus $prokkaThreads --force --compliant $prokkaIN --outdir $prokkaOUTDIR
cp -r $prokkaOUTDIR $egressPath/$prokkaOUTDIR
cp $prokkaOUTDIR/*.tsv $prokka_tsvFilename