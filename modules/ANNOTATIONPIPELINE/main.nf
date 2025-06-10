include {ingress_ANNOTATIONPIPELINE} from '../../modules/ingress'
include {prokka} from '../../modules/prokka'
include {egress_ANNOTATIONPIPELINE} from '../../modules/egress'

workflow {
	def ingress_ch = channel
		.fromPath(params.ingresspath + '*_contigs.fasta')
		.toSortedList( { a, b -> a[0] <=> b[0] } )
		.flatMap()

	def ANNOTATIONPIPELINE_ch = channel.of(ANNOTATIONPIPELINE(ingress_ch))

	ANNOTATIONPIPELINE_ch | view()
}


workflow ANNOTATIONPIPELINE {
	take:
		ingress_ch
	main:
		ingress_ANNOTATIONPIPELINE(ingress_ch) | prokka | egress_ANNOTATIONPIPELINE
	emit:		
		egress_ANNOTATIONPIPELINE.out
}

workflow.onComplete {
    println ( workflow.success ? """
	ANNOTATIONPIPELINE execution summary
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