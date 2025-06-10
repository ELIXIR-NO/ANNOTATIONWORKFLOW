process prokka {
	debug params.debug
	label 'prokka'
	conda './modules/prokka/environments/prokka_1.14.6.yaml'
	cpus params.defaultcpus
	memory params.defaultmemory
	time params.defaulttime
	maxForks params.defaultmaxForks
	maxErrors params.maxErrors
	errorStrategy params.errorStrategy		
	maxRetries params.maxRetries
	input:
		path(prokkaIN)
	output:
		path "*.tsv", emit: prokkaOUT
	when:
		true	
	script:	
		egressPath = params.egresspath
		prokkaThreads = params.defaultcpus
		prokka_refdata = params.launchdir + "/resources/prokka/"
		prokkaOUTDIR = "prokka_" + prokkaIN.getBaseName().substring(0, prokkaIN.getBaseName().lastIndexOf('_contigs'))		
		prokka_tsvFilename = prokkaIN.getBaseName().substring(0, prokkaIN.getBaseName().lastIndexOf('_contigs')) + ".tsv"
		template 'prokka.sh'
}