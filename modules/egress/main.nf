process egress_ANNOTATIONPIPELINE {
	debug params.debug
	label 'egress_ANNOTATIONPIPELINE'	
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
    	input:
		path(egressIN)	// annotation tsv
	output:		
		path "*.tsv", includeInputs:true, emit: egress_ANNOTATIONPIPELINE_OUT
	when:
		true
	script:			
		egressPath = params.egresspath
		egressOUT = params.egresspath + egressIN
		template 'egress_ANNOTATIONPIPELINE.sh'
}