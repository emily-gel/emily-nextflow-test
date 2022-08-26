#!/usr/bin/env nextflow

params.greeting  = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

include { SPLITLETTERS ; COWSAY } from './hello_processes.nf'

process SPLITLETTERS {
    input:
    val x from greeting_ch

    output:
    file 'chunk_*' into letters_ch

    script:
    """
    printf '$x' | split -b 6 - chunk_
    """
}

process COWSAY {
    input:
    val y from letters_ch.flatten()

    output:
    file 'cow_*'

    script:
    """
    cowsay $y.text
    """
}
