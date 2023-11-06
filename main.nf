include { groupTupleOnMetaKeys } from 'plugin/nf-metaMapOperators'

meta_map = [
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
    ch_letters = Channel.of( [ meta_map, 'A' ], [ meta_map, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ], letter ] }

    ch_letters.groupTupleOnMetaKeys(keys:'sample').view()
}

workflow JOINONKEYS{
    ch_letters = Channel.of( [ meta_map, 'A' ], [ meta_map, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ], letter ] }
    ch_numbers = Channel.of( [ meta_map, '1' ], [ meta_map, '2' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, number -> [ meta + [ number: number ], number ] }
    
    // Test new functions
    ch_letters.joinOnKeys(ch_numbers,'sample').view()
}

workflow COMBINEONKEYS{
    ch_letters = Channel.of( [ meta_map, 'A' ], [ meta_map, 'B' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, letter -> [ meta + [ letter: letter ], letter ] }
    ch_numbers = Channel.of( [ meta_map, '1' ], [ meta_map, '2' ] )
        // Add key to meta map that makes the meta distinct.
        .map { meta, number -> [ meta + [ number: number ], number ] }

    ch_letters.combineOnKeys(ch_numbers,'sample').view()
}
