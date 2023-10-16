params.input = [
    sample: 
        name: "Test" 
        ploidy: 2 
        chr_count: 13
        genome_size: 2300000
    reads:
        hic: 
            kmer_cov: 15
            single_end: false
        hifi: 
            kmer_cov: 50
            single_end: true
    assembly:
        assembler: "hifi"
        stage: "assemble"
    tools:
        busco_lineages: "auto"
]

workflow GROUPTUPLEONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
}

workflow JOINONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
    ch_numbers = Channel.of( [ params.input, '1' ], [ params.input, '2' ] )
}

workflow COMBINEONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
    ch_numbers = Channel.of( [ params.input, '1' ], [ params.input, '2' ] )
}