process ingress_ANNOTATIONPIPELINE {	
	debug params.debug
	label 'ingress_ANNOTATIONPIPELINE'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries		
        input:
		path(ingressFILE)
	output:
		path "*_contigs.fasta", includeInputs:true, emit: ingress_ANNOTATIONPIPELINE_OUT		
	when:
		true	
	script:		
		egressPath = params.egresspath
		
		ingressIN = ingressFILE.getName()
		ingressOUT = ingressFILE.getName()

		template 'ingress_ANNOTATIONPIPELINE.sh'
}