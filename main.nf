include {ANNOTATIONPIPELINE} from './modules/ANNOTATIONPIPELINE'

workflow {
	def ingress_ch = channel
		.fromFilePairs(params.ingresspath + '*_contigs.fasta')
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()
	
	def ANNOTATIONWORKFLOW_ch = channel.of(ANNOTATIONWORKFLOW(ingress_ch))
	
	ANNOTATIONWORKFLOW_ch | view()
}


workflow ANNOTATIONWORKFLOW {
	take:
		ingress_ch
	main:
		ANNOTATIONPIPELINE(ingress_ch)
	emit:
		ANNOTATIONPIPELINE.out
}


workflow.onComplete {
    println ( workflow.success ? """
	ANNOTATIONWORKFLOW execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """ : """
        Failed: ${workflow.errorReport}
        exit status : ${workflow.exitStatus}
        """
    )
}