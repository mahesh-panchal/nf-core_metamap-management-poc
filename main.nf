params.input = [
    sample: [ 
        name: "Test", 
        ploidy: 2, 
        chr_count: 13, 
        genome_size: 2300000 
    ],
    reads: [
        hic: [ 
            kmer_cov: 15,
            single_end: false
        ],
        hifi: [ 
            kmer_cov: 50,
            single_end: true
        ],
    ],
    assembly: [
        assembler: "hifi",
        stage: "assemble"
    ],
    tools: [
        busco_lineages: "auto"
    ]
]

workflow GROUPTUPLEONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ] ] }
}

workflow JOINONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ] ] }
    ch_numbers = Channel.of( [ params.input, '1' ], [ params.input, '2' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, number -> [ meta + [ number: number ] ] }
}

workflow COMBINEONKEYS{
    ch_letters = Channel.of( [ params.input, 'A' ], [ params.input, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ] ] }
    ch_numbers = Channel.of( [ params.input, '1' ], [ params.input, '2' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, number -> [ meta + [ number: number ] ] }
}