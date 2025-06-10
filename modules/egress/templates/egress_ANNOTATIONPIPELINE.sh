#!/bin/bash
#Default pipeline or stage egress for pair read tools
if [ ! -f $egressOUT ]; then
	cp $egressIN $egressOUT
fi

#Record the files
echo '$egressIN $egressOUT' >> $egressPath/ANNOTATIONPIPELINE_egressedFiles.txt